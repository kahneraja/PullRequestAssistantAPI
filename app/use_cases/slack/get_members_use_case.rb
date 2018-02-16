module Slack

  class GetMembersUseCase

    def initialize(gateway = SlackGateway.new)
      @gateway = gateway
    end

    def execute(token)
      @gateway.get_members(token)
    end

  end

end
