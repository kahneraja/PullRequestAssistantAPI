require 'rails_helper'

describe Slack::BroadcastMessageUseCase do
  describe 'when broadcasting a message' do

    let(:gateway) {double(post_message: true)}

    describe 'when not in simulation mode' do

      let(:user) {double(simulation_mode: false, slack_token: '')}

      it 'should call gateway' do
        expect(gateway).to receive(:post_message).exactly(1).times
        Slack::BroadcastMessageUseCase.new(gateway).execute('', '', user)
      end

    end

    describe 'when in simulation mode' do

      let(:user) {double(simulation_mode: true, slack_token: '')}

      it 'should call gateway' do
        expect(gateway).to receive(:post_message).exactly(0).times
        Slack::BroadcastMessageUseCase.new(gateway).execute('', '', user)
      end

    end

  end

end
