module Github

  class TokensController < ApplicationController

    def create
      user = CreateNewUserUseCase.new.execute(params['client_id'], params['client_secret'], params['code'])
      render json: user
    end

  end

end