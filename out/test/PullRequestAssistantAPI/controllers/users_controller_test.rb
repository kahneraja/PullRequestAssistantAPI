require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  fixtures :users

  def test_index
    get "/users"
    assert_equal 200, status
    assert_equal 2, JSON.parse(@response.body).count
  end

end
