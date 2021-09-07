require "test_helper"

class PartialControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partial_index_url
    assert_response :success
  end
end
