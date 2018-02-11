class GithubGateway
  def createToken(clientId, clientSecret, code)
    body = {
        'client_id' => clientId,
        'client_secret' => clientSecret,
        'code' => code

    }.to_json
    response = HTTParty.post('https://github.com/login/oauth/access_token',
                             :headers => {
                                 'Accept' => 'application/json',
                                 'Content-Type' => 'application/json'
                             },
                             :body => body).response
    case response.code
      when "200"
        true
      else
        false
    end
  end
end