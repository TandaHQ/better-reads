require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the user model validates password length" do
    user = User.new(email: "test@testing.com", password: "short")
    assert_not user.save
    assert_equal [:password], user.errors.as_json.keys

    user.password = "muchlongerpassword"
    assert user.save
  end
end
