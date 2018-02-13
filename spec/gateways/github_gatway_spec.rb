require 'rails_helper'

def createResponse(body)
  response = PostResponse.new
  response.body = body
  request = PostRequest.new
  request.response = response
  request
end

describe GithubGateway do

  HttpClient = HTTParty
  PostRequest = Struct.new(:response)
  PostResponse = Struct.new(:body)

  it 'createToken should return token when successful' do
    httpClient = HttpClient
    request = createResponse('{"access_token":"ABC","token_type":"bearer","scope":"read"}')

    gateway = GithubGateway.new(httpClient)

    expect(httpClient).to receive(:post).and_return(request)

    token = gateway.create_token('', '', '')

    expect(token['access_token']).to eq('ABC')
  end

  it 'get_current_user should return a user when successful' do
    httpClient = HttpClient
    request = createResponse('{"id": 123}')

    gateway = GithubGateway.new(httpClient)

    expect(httpClient).to receive(:get).and_return(request)

    currentUser = gateway.get_current_user('')

    expect(currentUser['id']).to eq(123)
  end

end
