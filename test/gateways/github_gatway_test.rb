require 'test_helper'
require 'doubles/stub_http_client'

class GithubGatewayTest < ActiveSupport::TestCase

  test 'createToken should return token when successful' do
    httpClient = StubHttpClient.new('200',
                                    '{"access_token":"ABC","token_type":"bearer","scope":"read"}')
    gateway = GithubGateway.new(httpClient)
    token = gateway.create_token('', '', '')
    assert token['access_token'] == 'ABC'
  end

  test 'get_current_user should return a user when successful' do
    httpClient = StubHttpClient.new('200',
                                    '{"id": 123}')
    gateway = GithubGateway.new(httpClient)
    currentUser = gateway.get_current_user('')
    assert currentUser['id'] == 123
  end

end
