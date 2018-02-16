module Github

  class CreateNewUserUseCase

    def initialize(github_gateway = GithubGateway.new)
      @github_gateway = github_gateway
    end

    def execute(client_id, client_secret, code)
      token = @github_gateway.create_token(client_id, client_secret, code)
      current_user = @github_gateway.get_current_user(token['access_token'])
      github_id = current_user['id']
      access_token = token['access_token']
      user = User.find_by_github_id(current_user['id'])
      unless user.present?
        user = User.create(
          github_id: github_id,
          github_token: access_token
        )
      end
      user
    end

  end

end