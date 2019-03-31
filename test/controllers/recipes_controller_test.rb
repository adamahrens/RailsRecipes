require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create(name: 'Leroy', email: 'leroy@chef.com')
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
end
