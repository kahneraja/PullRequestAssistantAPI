class GithubGateway

  def initialize(httpClient = HTTParty)
    @httpClient = httpClient
  end

  def createToken(clientId, clientSecret, code)
    body = {
        'client_id' => clientId,
        'client_secret' => clientSecret,
        'code' => code

    }.to_json
    response = @httpClient.post('https://github.com/login/oauth/access_token',
                                {
                                    :headers => {
                                        'Accept' => 'application/json',
                                        'Content-Type' => 'application/json'
                                    },
                                    :body => body
                                }).response
    JSON.parse(response.body)
  end

  def getCurrentUser(token)
    response = @httpClient.get('https://api.github.com/user',
                               {
                                   :headers => {
                                       'Accept' => 'application/json',
                                       'Content-Type' => 'application/json',
                                       'User-Agent' => '',
                                       'Authorization' => "token #{token}"
                                   }
                               }).response
    JSON.parse(response.body)
  end

end