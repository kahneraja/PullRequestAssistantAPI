class GithubController < ApplicationController

  def tokens
    user = Github::CreateNewUserUseCase.new.execute(params['code'])
    render json: user
  end

  def orgs
    user_id = params[:user_id]
    token = User.find(user_id).github_token
    orgs = Github::GetOrgsUseCase.new.execute(token)
    render json: orgs
  end

  def members
    expires_in 1.hour, public: true
    members = Github::GetMembersUseCase.new.execute(params[:user_id])
    render json: members
  end

end

