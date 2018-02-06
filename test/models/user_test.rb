require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "user@example.com", password_digest: "fakep@ssword")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password_digest = "     "
    assert_not @user.valid?
  end

  test "email should contain @" do
    @user.email = @user.email.include? "@"
    assert_not @user.valid?
  end

end