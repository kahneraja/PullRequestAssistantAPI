class SlackGateway

  def initialize(httpClient = HTTParty)
    @logger = Logger.new(STDOUT)
    @httpClient = httpClient
  end

  def create_token(code, redirect_uri)
    api = 'https://slack.com/api/oauth.access'

    client_id = ENV['SLACK_CLIENT_ID']
    client_secret = ENV['SLACK_CLIENT_SECRET']
    scope = 'chat:write:bot,users:read'

    url = "#{api}?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}&redirect_uri=#{redirect_uri}&scope=#{scope}"

    @logger.debug { redirect_uri }
    @logger.debug { url }

    response = @httpClient.post(url,
                                headers: {
                                  'Accept' => 'application/json',
                                  'Content-Type' => 'application/json'
                                }).response
    @logger.debug { response.body }
    JSON.parse(response.body)
  end

  def get_members(token)
    url = 'https://slack.com/api/users.list?limit=200'
    response = @httpClient.get(url,
                               headers: {
                                 'Accept' => 'application/json',
                                 'Content-Type' => 'application/json',
                                 'Authorization' => "Bearer #{token}"
                               }).response
    JSON.parse(response.body)['members']
  end

end
