require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    user = users(:austin)
    post session_path, params: { email: user.email, password: "betterreads" }
    get user_path(users)
    assert_response :success
  end
end
