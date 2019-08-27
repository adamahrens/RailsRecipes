require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @ingredient = Ingredient.create(name: 'Oreo')
  end

  test 'should be able to get index' do
    get ingredients_path
    assert_response :success
  end

  test 'should be able to fetch ingredients on index' do
    get ingredients_path
    assert_template 'ingredients/index'
    assert_equal Ingredient.all, assigns(:ingredients)
    assert_match @ingredient.name, @response.body
  end

  test 'should be able to show a single ingredient' do
    get ingredient_path(@ingredient)
    assert_template 'ingredients/show'
    assert_equal @ingredient, assigns(:ingredient)
    assert_match @ingredient.name, @response.body
  end
end
