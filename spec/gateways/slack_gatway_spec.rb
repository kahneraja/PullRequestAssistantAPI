require 'rails_helper'

describe SlackGateway do

  describe 'when getting a new access token' do

    let(:httpClient) {double(post: response)}
    let(:gateway) {SlackGateway.new(httpClient)}

    subject(:token) {
      gateway.create_token('', '')
    }

    describe 'when successful' do

      let(:body) {double(body: '{"access_token" : "ABC"}')}
      let(:response) {double(response: body)}

      it 'should return an access token' do
        expect(token['access_token']).to eq('ABC')
      end

    end

  end

  describe 'when broading message' do

    let(:httpClient) {double(post: response)}
    let(:gateway) {SlackGateway.new(httpClient)}

    subject(:result) {
      gateway.post_message('', '', '')
    }

    describe 'when successful' do

      let(:response) {double(success: true)}

      it 'should return successful' do
        expect(result.success).to eq(true)
      end

    end

  end

end
