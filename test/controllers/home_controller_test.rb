require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should be able to get home' do
    get home_url
    assert_response :success
  end

  test 'should be able to get about' do
    get about_url
    assert_response :success
  end
end
