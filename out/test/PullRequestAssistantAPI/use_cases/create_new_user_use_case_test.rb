require 'test_helper'
require 'gateways/stub_github_gatway'

class CreateNewUserUseCaseTest < ActiveSupport::TestCase

  test 'should create a new user' do
    github_gateway = StubGithubGateway.new()
    use_case = CreateNewUserUseCase.new(github_gateway)
    user = use_case.execute('', '', '')
    assert user.id == 1
    assert User.all.count == 1
  end

  test 'should retrieve an existing user' do
    User.create(:github_id => 1, :github_token => '')
    github_gateway = StubGithubGateway.new()
    use_case = CreateNewUserUseCase.new(github_gateway)
    user = use_case.execute('', '', '')
    assert user.id == 1
    assert User.all.count == 1
  end

end
