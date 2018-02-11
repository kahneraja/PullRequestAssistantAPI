class Github::TokensController < ApplicationController

  def initialize(create_new_user_use_case = CreateNewUserUseCase.new)
    @create_new_user_use_case = create_new_user_use_case
  end

  def create
    user = @create_new_user_use_case.execute(params['client_id'], params['client_secret'], params['code'])
    render json: user
  end

end
