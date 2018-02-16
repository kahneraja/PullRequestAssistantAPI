module Slack

  class TokensController < ApplicationController

    def create
      user = Slack::ApplyTokenUseCase.new.execute(params['id'], params['client_id'], params['client_secret'], params['code'], params['redirect_url'])
      render json: user
    end

  end

end