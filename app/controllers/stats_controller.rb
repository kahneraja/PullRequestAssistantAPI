class StatsController < ApplicationController
  def index
    @stats = Stat.all
    render json: @stats
  end
end
