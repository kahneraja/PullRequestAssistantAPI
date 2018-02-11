require 'test_helper'
require 'gateways/stub_http_client'

class GithubGatewayTest < ActiveSupport::TestCase

  test 'createToken should return token when successful' do
    httpClient = StubHttpClient.new('200',
                                    '{"access_token":"ABC","token_type":"bearer","scope":"read"}')
    gateway = GithubGateway.new(httpClient)
    token = gateway.createToken('', '', '')
    assert_equal token['access_token'], 'ABC'
  end

  test 'getCurrentUser should return a user when successful' do
    httpClient = StubHttpClient.new('200',
                                    '{"id": 123}')
    gateway = GithubGateway.new(httpClient)
    currentUser = gateway.getCurrentUser('')
    assert_equal currentUser['id'], 123
  end

end
