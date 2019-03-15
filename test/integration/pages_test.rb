require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  test 'should get the homepage' do
    get home_url
    assert_response :success
  end

  test 'should get the root path' do
    get root_url
    assert_response :success
  end
end
