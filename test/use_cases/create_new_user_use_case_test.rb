require 'test_helper'
require 'doubles/stub_github_gateway'
require 'doubles/stub_user_repository'

class CreateNewUserUseCaseTest < ActiveSupport::TestCase
  test 'should create a new user' do
    github_repository = StubGithubGateway.new
    user_repository = StubUserRepository.new
    use_case = CreateNewUserUseCase.new(github_repository, user_repository)
    use_case.execute('', '', '')
    assert user_repository.count == 1
  end

  test 'should retrieve an existing user' do
    github_repository = StubGithubGateway.new
    user_repository = StubUserRepository.new
    user_repository.create(1, '')
    use_case = CreateNewUserUseCase.new(github_repository, user_repository)
    use_case.execute('', '', '')
    assert user_repository.count == 1
  end
end
