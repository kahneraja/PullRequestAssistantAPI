module Slack

  class BroadcastMessageUseCase

    def initialize(gateway = SlackGateway.new)
      @gateway = gateway
    end

    def execute(channel, message, user)
      if !user.simulation_mode
        @gateway.post_message(channel, message, user.slack_token)
      end
      AuditMessage.create(channel: channel, message: message, org_id: user.org.id)
    end

  end

end
