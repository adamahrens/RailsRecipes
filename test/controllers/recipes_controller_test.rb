require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create(name: 'Leroy', email: 'leroy@chef.com', password: 'password1234', password_confirmation: 'password1234')
    @r1 = Recipe.create(name: 'Cookies Shake', description: 'Cookies & Cream Shake', chef: @chef)
    @r2 = Recipe.create(name: 'Hamburger', description: 'Angus Beef with Lettuce & Tomato', chef: @chef)
  end

  test 'should be able to get index' do
    get recipes_path
    assert_response :success
  end

  test 'should be able to fetch recipes on index' do
    get recipes_path
    assert_template 'recipes/index'
    assert_equal Recipe.all, assigns(:recipes)
    assert_match @r1.name, @response.body
    assert_match @r2.name, @response.body
  end

  test 'should be able to show a single recipe' do
    get recipe_path(@r1)
    assert_template 'recipes/show'
    assert_equal @r1, assigns(:recipe)
    assert_match @r1.name, @response.body
  end

  test 'should be able to get a new recipe form thats valid' do
    get new_recipe_path
    assert_template 'recipes/new'
    name_of_recipe = 'Chicken Saute'
    directions = 'add chicken plus beef broth and carrots'
    params = { recipe: { name: name_of_recipe, description: directions, chef_id: @chef.id } }
    assert_difference 'Recipe.count', 1 do
      post recipes_path, params: params
    end
    follow_redirect!
    assert_match name_of_recipe, response.body
    assert_match directions, response.body
  end

  test 'should be able to get a new recipe form thats invalid' do
    get new_recipe_path
    assert_template 'recipes/new'
    assert_no_difference 'Recipe.count' do
      post recipes_path, params: { recipe: { name: '', description: '' } }
    end
    assert_template 'recipes/new'
  end

  test 'should be able to edit a valid recipe' do
    updated_name = 'New Recipe Name'
    get edit_recipe_path(@r1)
    assert_template 'recipes/edit'
    patch recipe_path(@r1), params: { recipe: { name: updated_name, description: @r1.description } }
    follow_redirect!
    assert_template 'recipes/show'
    assert_match updated_name, @response.body
  end

  test 'should be unable to edit an invalid recipe' do
    get edit_recipe_path(@r1)
    assert_template 'recipes/edit'
    patch recipe_path(@r1), params: { recipe: { name: '', description: @r1.description } }
    assert_template 'recipes/edit'
  end

  test 'should be able to delete' do
    get recipe_path(@r1)
    assert_template 'recipes/show'
    delete recipe_path(@r1)
    follow_redirect!
    assert_template 'recipes/index'
    assert_no_match @r1.name, @response.body
  end
end
