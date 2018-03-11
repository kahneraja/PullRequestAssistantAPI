class SlackGateway

  def initialize(httpClient = HTTParty)
    @httpClient = httpClient
  end

  def create_token(code, redirect_uri)
    api = 'https://slack.com/api/oauth.access'

    client_id = ENV['SLACK_CLIENT_ID']
    client_secret = ENV['SLACK_CLIENT_SECRET']
    scope = 'chat:write:bot,users:read'

    url = "#{api}?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}&redirect_uri=#{redirect_uri}&scope=#{scope}"

    headers = {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }

    response = @httpClient.post(url, headers: headers).response

    JSON.parse(response.body)
  end

  def get_members(token)
    url = 'https://slack.com/api/users.list?limit=200'
    response = @httpClient.get(url, headers: auth_headers(token)).response
    JSON.parse(response.body)['members']
  end

  def post_message(text, channel, token)
    url = 'https://slack.com/api/chat.postMessage'

    body = {
      text: text,
      channel: "@#{channel}",
      as_user: ENV['BOT_NAME']
    }

    @httpClient.post(url, headers: auth_headers(token), body: body)
  end

  def auth_headers(token)
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{token}"
    }
  end

end
