class SlackController < ApplicationController

  before_action :set_user

  def tokens
    user = Slack::ApplyTokenUseCase.new.execute(params[:user_id], params['code'], params['redirect_uri'])
    render json: user
  end

  def members
    expires_in 1.hour, public: true
    members = Slack::GetMembersUseCase.new.execute(@user.slack_token)
    render json: members
  end

  def broadcast_message
    message = params[:message]
    channel = params[:channel]
    Slack::BroadcastMessageUseCase.new.execute(channel, message, @user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end

