require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'should get signup path' do
    get signup_path
    assert_response :success
  end

  test 'reject an invalid signup form' do
    get signup_path
    assert_template 'chefs/new'
    assert_no_difference 'Chef.count' do
      post chefs_path, params: { chef: { name: ' ', email: ' ', password: ' ', password_confirmation: ' ' } }
    end
    assert_template 'chefs/new'
  end

  test 'accept a valid signup form' do
    get signup_path
    assert_template 'chefs/new'
    assert_difference 'Chef.count', 1  do
      post chefs_path, params: { chef: { name: 'Leroy Jeknis', email: 'leroy.jenkins@email.com', password: 'password1234', password_confirmation: 'password1234' } }
    end
  end
end
