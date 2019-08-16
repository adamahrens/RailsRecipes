require 'test_helper'

class ChefDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(name: 'Leroy',
                         email: 'leroy.jenkins@email.com',
                         password: 'password1',
                         password_confirmation: 'password1')
    @chef2 = Chef.create!(name: 'Gordon Ramsay',
                          email: 'gordon.ramsay@email.com',
                          password: 'password1',
                          password_confirmation: 'password1')
  end

  test 'should have an index listing page of chefs' do
    sign_in_as(@chef2, 'password1')
    get chefs_path
    assert_template 'chefs/index'
    assert_select 'a[href=?]', chef_path(@chef)
    assert_select 'a[href=?]', chef_path(@chef2)
  end

  test 'should be able to delete chef from index page' do
    sign_in_as(@chef2, 'password1')
    get chefs_path
    assert_template 'chefs/index'
    assert_difference 'Chef.count', -1 do
      delete chef_path(@chef2)
    end
    assert_redirected_to chefs_path
    assert_not flash.empty?
  end

  test 'associated recipes should be destroyed' do
    @chef.save
    @chef.recipes.create!(name: 'test_name', description: 'test_description')
    assert_difference 'Recipe.count', -1 do
      @chef.destroy
    end
  end
end
