require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def test_index
    get "/users"
    assert_equal 200, status
    assert_equal 0, JSON.parse(@response.body).count
  end

end
