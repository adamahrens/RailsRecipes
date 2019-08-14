require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  def setup
    get login_path
    @chef = Chef.create!(name: 'Leroy',
                         email: 'blah.blah@email.com',
                         password: 'password1234!',
                         password_confirmation: 'password1234!')
  end

  test 'invalid login is rejected' do
    post login_path, params: { session: { email: ' ', password: ' ' } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'valid login credentials is accepted' do
    post login_path, params: { session: { email: @chef.email, password: 'password1234!'} }
    assert_redirected_to @chef
    follow_redirect!
    assert_template 'chefs/show'
    assert_not flash.empty?
  end
end
