class ContributorsController < ApplicationController

  def create
    user_id = request.headers['User-Id']
    org = Org.find_by_user_id(user_id)

    Contributor.where(org_id: org.id).destroy_all

    contributors = params[:contributors]
    contributors.map {|contributor|
      Contributor.create(
        github_name: contributor[:github_name],
        slack_name: contributor[:slack_name],
        org: org
      )
    }
  end

end
