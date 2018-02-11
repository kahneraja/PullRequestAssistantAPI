class StubUserRepository

  def initialize
    @users = []
  end

  def find_by_github_id(github_id)
    @users.select {|a| a.github_id == github_id}
  end

  def create(github_id, github_token)
    user = User.new(
      github_id: github_id,
      github_token: github_token
    )
    @users.push(user)
  end

  def count
    @users.count
  end
end
