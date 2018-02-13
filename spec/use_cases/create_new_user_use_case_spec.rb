require 'rails_helper'

describe CreateNewUserUseCase do

  it 'should create a new user' do
    github_repository = GithubGateway.new

    expect(github_repository).to receive(:create_token).and_return({'access_token' => 'ABC'})
    expect(github_repository).to receive(:get_current_user).and_return({'id' => 123})
    expect(User).to receive(:find_by_github_id).and_return(nil)
    expect(User).to receive(:create).once

    use_case = CreateNewUserUseCase.new(github_repository)
    use_case.execute('', '', '')
  end

  it 'should retrieve an existing user' do
    github_repository = GithubGateway.new

    existing_user = User.new(:github_id => 1, :github_token => 'ABC')

    expect(github_repository).to receive(:create_token).and_return({'access_token' => 'ABC'})
    expect(github_repository).to receive(:get_current_user).and_return({'id' => 123})
    expect(User).to receive(:find_by_github_id).and_return(existing_user)
    expect(User).to receive(:create).never

    use_case = CreateNewUserUseCase.new(github_repository)
    use_case.execute('', '', '')
  end

end
