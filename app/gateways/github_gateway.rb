class GithubGateway

  def initialize(httpClient = HTTParty)
    @httpClient = httpClient
  end

  def create_token(code)
    body = {
      'client_id' => ENV['GITHUB_CLIENT_ID'],
      'client_secret' => ENV['GITHUB_CLIENT_SECRET'],
      'code' => code

    }.to_json

    response = @httpClient.post('https://github.com/login/oauth/access_token',
                                headers: headers,
                                body: body).response

    JSON.parse(response.body)
  end

  def get_current_user(token)
    response = @httpClient.get('https://api.github.com/user',
                               headers: auth_headers(token)).response
    JSON.parse(response.body)
  end

  def get_orgs(token)
    response = @httpClient.get('https://api.github.com/user/orgs',
                               headers: auth_headers(token)).response
    JSON.parse(response.body)
  end

  def get_members(org, token)
    url = "#{org.url}/members?per_page=100"
    response = @httpClient.get(url,
                               headers: auth_headers(token)).response
    JSON.parse(response.body)
  end

  def get_repos(org, token)
    url = "#{org.url}/repos?per_page=100"
    response = @httpClient.get(url,
                               headers: auth_headers(token)).response
    JSON.parse(response.body)
  end

  def get_pull_requests(repo_url, state, token)
    url = "#{repo_url}/pulls?per_page=100&state=#{state}"
    response = @httpClient.get(url,
                               headers: auth_headers(token)).response
    JSON.parse(response.body)
  end

  def get_files(pull_request_url, token)
    url = "#{pull_request_url}/files"
    response = @httpClient.get(url,
                               headers: auth_headers(token)).response
    JSON.parse(response.body)
  end

  def get_comments(comments_url, token)
    response = @httpClient.get(comments_url,
                               headers: auth_headers(token)).response
    JSON.parse(response.body)
  end

  def get_member(login, token)
    url = "https://api.github.com/users/#{login}"
    response = @httpClient.get(url,
                               headers: auth_headers(token)).response
    JSON.parse(response.body)
  end

  private

  def headers
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json',
      'User-Agent' => ''
    }
  end

  def auth_headers(token)
    {
      'Content-Type' => 'application/json',
      'Authorization' => "token #{token}",
      'User-Agent' => ''
    }
  end
end
