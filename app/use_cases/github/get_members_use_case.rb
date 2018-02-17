module Github

  class GetMembersUseCase

    def initialize(gateway = GithubGateway.new)
      @gateway = gateway
    end

    def execute(user_id)
      user = User.find(user_id)
      @gateway.get_members(user.org, user.github_token)
    end

  end

end
