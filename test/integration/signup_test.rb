require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'should get signup path' do
    get signup_path
    assert_response :success
  end
end
