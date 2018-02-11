class Github::TokensController < ApplicationController

  def initialize(githubGatway = GithubGateway.new)
    @githubGateway = githubGatway
  end

  def create
    token = @githubGateway.createToken(params[:client_id],params[:client_secret],params[:code])
    currentUser = @githubGateway.getCurrentUser(token['access_token'])
    render json: currentUser
  end

end
