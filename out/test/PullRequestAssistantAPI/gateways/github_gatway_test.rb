require 'test_helper'
require 'gateways/stub_http_client'

class GithubGatewayTest < ActiveSupport::TestCase

  test 'should return token when successful' do
    httpClient = StubHttpClient.new('200',
                                    '{"access_token":"ABC","token_type":"bearer","scope":"read"}')
    gateway = GithubGateway.new(httpClient)
    token = gateway.createToken('', '', '')
    assert_equal token, "ABC"
  end

end
