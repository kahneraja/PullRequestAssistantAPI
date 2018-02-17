module Slack

  class ApplyTokenUseCase

    def initialize(gateway = SlackGateway.new)
      @gateway = gateway
    end

    def execute(user_id, client_id, client_secret, code, redirect_url)
      token = @gateway.create_token(client_id, client_secret, code, redirect_url)
      access_token = token['access_token']
      user = User.find(user_id)
      user.slack_token = access_token
      user.save
      user
    end

  end

end