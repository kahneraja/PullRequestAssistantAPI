module Github

  class GetMembersUseCase

    def initialize(gateway = GithubGateway.new)
      @gateway = gateway
    end

    def execute(user_id)
      user = User.find(user_id)
      members = @gateway.get_members(user.org, user.github_token)
      members.map { |member|
        @gateway.get_member(member['login'], user.github_token)
      }
    end

  end

end
