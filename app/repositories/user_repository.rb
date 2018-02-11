class UserRepository

  def find_by_github_id(github_id)
    User.find_by_github_id(github_id)
  end

  def create(github_id, github_token)
    User.create(
      github_id: github_id,
      github_token: github_token
    )
  end

end
