class SlackController < ApplicationController

  def tokens
    user = Slack::ApplyTokenUseCase.new.execute(params[:user_id], params['client_id'], params['client_secret'], params['code'], params['redirect_url'])
    render json: user
  end

  def members
    user_id = params[:user_id]
    user = User.find(user_id)
    members = Slack::GetMembersUseCase.new.execute(user.slack_token)
    render json: members
  end

end

