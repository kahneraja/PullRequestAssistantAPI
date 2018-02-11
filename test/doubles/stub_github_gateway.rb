class StubGithubGateway

  def create_token(clientId, clientSecret, code)
    {
        'access_token' => 'ABC'
    }
  end

  def get_current_user(token)
    {
        'id' => 1
    }
  end

end