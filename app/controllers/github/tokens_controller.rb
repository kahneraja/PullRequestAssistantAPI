class Github::TokensController < ApplicationController

  before_action :load_gateways

  def create
    result = @githubGateway.createToken(params[:client_id],params[:client_secret],params[:code])
    render json: result
  end

  def load_gateways(service = GithubGateway.new)
    @githubGateway ||= service
  end

end
