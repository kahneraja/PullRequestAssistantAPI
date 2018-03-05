module Github
  class GetStatsUseCase
    def initialize(gateway = GithubGateway.new)
      @gateway = gateway
    end

    def execute
      User.all.map do |user|
        Stat.where(org_id: user.org.id).destroy_all
        repos = @gateway.get_repos(user.org, user.github_token)
        repos.map do |repo|
          pull_requests = @gateway.get_pull_requests(repo['url'], 'closed', user.github_token)
          pull_requests.map do |pull_request|
            files = @gateway.get_files(pull_request['url'], user.github_token)
            comments = @gateway.get_comments(pull_request['_links']['comments']['href'], user.github_token)
            change_count = files.reduce(0) { |sum, obj| sum + obj['changes'].to_i }
            Stat.create(
              title: pull_request['title'],
              url: pull_request['url'],
              created: start_of_week(pull_request['created_at']),
              closed: start_of_week(pull_request['closed_at']),
              hours: hours_open(pull_request),
              change_count: change_count,
              comments: comments.count,
              org_id: user.org.id
            )
          end
        end
      end
    end

    def start_of_week(date_value)
      date = date_value.to_datetime
      day_of_week = date.wday
      (date - day_of_week.days).to_date
    end

    def hours_open(pull_request)
      start_time = pull_request['created_at'].to_time
      end_time = pull_request['closed_at'].to_time
      seconds_diff = (start_time - end_time).to_i.abs
      seconds_diff / 3600
    end

  end
end
