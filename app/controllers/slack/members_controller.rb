module Slack

  class MembersController < ApplicationController

    def index
      members = Slack::GetMembersUseCase.new().execute(request.headers['Slack-Token'])
      render json: members
    end

  end

end