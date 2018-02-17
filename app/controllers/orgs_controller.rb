class OrgsController < ApplicationController

  before_action :set_user
  before_action :set_org, only: [:show, :update, :destroy]

  # GET /orgs
  def index
    @orgs = Org.find_by_user_id(:user_id)

    render json: @orgs
  end

  # GET /orgs/1
  def show
    render json: @org
  end

  # POST /orgs
  def create
    @user.org = Org.new(org_params)
    @user.org.save
    render json: @user.org
  end

  # PATCH/PUT /orgs/1
  def update
    if @org.update(org_params)
      render json: @org
    else
      render json: @org.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orgs/1
  def destroy
    @org.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_org
    @org = Org.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  # Only allow a trusted parameter "white list" through.
  def org_params
    params.permit(:github_id, :url, :login, :description)
  end
end
