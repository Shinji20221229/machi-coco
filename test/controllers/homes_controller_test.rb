require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top.index" do
    get homes_top.index_url
    assert_response :success
  end
end
