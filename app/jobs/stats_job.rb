class StatsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Github::GetStatsUseCase.new.execute()
  end
end
