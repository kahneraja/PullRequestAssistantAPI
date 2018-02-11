class CreateNewUserUseCase
  def initialize(
    github_gateway = GithubGateway.new,
    user_repository = UserRepository.new
  )
    @github_gateway = github_gateway
    @user_repository = user_repository
  end

  def execute(client_id, client_secret, code)
    token = @github_gateway.create_token(client_id, client_secret, code)
    current_user = @github_gateway.get_current_user(token['access_token'])
    github_id = current_user['id']
    access_token = token['access_token']
    user = @user_repository.find_by_github_id(current_user['id'])
    unless user.present?
      user = @user_repository.create(github_id, access_token)
    end
    user
  end
end
