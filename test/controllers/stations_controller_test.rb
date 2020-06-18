require 'test_helper'

class StationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stations_new_url
    assert_response :success
  end

  test "should get create" do
    get stations_create_url
    assert_response :success
  end

end
