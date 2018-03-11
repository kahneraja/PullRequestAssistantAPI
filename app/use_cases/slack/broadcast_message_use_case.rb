module Slack

  class BroadcastMessageUseCase

    def initialize(gateway = SlackGateway.new)
      @gateway = gateway
    end

    def execute(message, channel, user)
      if !user.simulation_mode
        @gateway.post_message(message, channel, user.slack_token)
      end
    end

  end

end
