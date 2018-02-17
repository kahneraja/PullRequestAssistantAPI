class SlackController < ApplicationController

  def tokens
    user = Slack::ApplyTokenUseCase.new.execute(params[:user_id], params['client_id'], params['client_secret'], params['code'], params['redirect_url'])
    render json: user
  end

  def members
    user_id = params[:user_id]
    slack_token = User.find(user_id)
    members = Slack::GetMembersUseCase.new().execute(slack_token)
    render json: members
  end

end

