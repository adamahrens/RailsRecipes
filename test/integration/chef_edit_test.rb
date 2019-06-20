require 'test_helper'
class ChefEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(name: 'Leroy',
                         email: 'leroy.jenkins@email.com',
                         password: 'password1',
                         password_confirmation: 'password1')
  end

  test 'should reject an invalid edit' do
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { name: ' ', email: 'Jenkins' } }
    assert_template 'chefs/edit'
  end

  test 'should accept a valid edit' do
    name_update = 'Leroy!'
    email_update = 'leroy.jenkins@update.com'
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef),
          params: { chef: { name: name_update, email: email_update } }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match name_update, @chef.name
    assert_match email_update, @chef.email
  end
end
