require 'rails_helper'

describe GithubGateway do

  describe 'when getting a new access token' do

    let(:httpClient) {double(post: response)}
    let(:gateway) {GithubGateway.new(httpClient)}

    subject(:token) {
      gateway.create_token('', '', '')
    }

    describe 'when successful' do

      let(:body) {double(body: '{"access_token" : "ABC"}')}
      let(:response) {double(response: body)}

      it 'should return an access token' do
        expect(token['access_token']).to eq('ABC')
      end

    end
  end

  describe 'when getting the user for a given token' do

    let(:httpClient) {double(get: response)}
    let(:gateway) {GithubGateway.new(httpClient)}

    subject(:github_user) {
      gateway.get_current_user('')
    }

    describe 'when successful' do

      let(:body) {double(body: '{"id" : 1}')}
      let(:response) {double(response: body)}

      it 'should return a github user' do
        expect(github_user['id']).to eq(1)
      end

    end
  end
end
