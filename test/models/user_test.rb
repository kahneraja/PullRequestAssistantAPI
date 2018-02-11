require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "github id token must exist" do
    user = User.new
    user.github_token = "ABC"
    assert_not user.save, "Saved without a github token"
  end

  test "github token must exist" do
    user = User.new
    user.github_id = 1
    assert_not user.save, "Saved without a github id"
  end

end
