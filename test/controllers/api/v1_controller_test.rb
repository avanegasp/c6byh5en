require 'test_helper'

class Api::V1ControllerTest < ActionDispatch::IntegrationTest
  test "should get v1" do
    get api_v1_v1_url
    assert_response :success
  end

end
