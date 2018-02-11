require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "slack token must exist" do
    user = User.new
    user.github_token = ""
    assert_not user.save, "Saved without a slack token"
    end
  test "github token must exist" do
    user = User.new
    user.slack_token = ""
    assert_not user.save, "Saved without a github token"
  end
end
