require 'rails_helper'

describe Slack::BroadcastMessageUseCase do

  describe 'when broadcasting a message' do

    let(:gateway) {double(post_message: true)}
    let(:org) {double(id: 1)}

    describe 'when not in simulation mode' do

      let(:user) {double(simulation_mode: false, slack_token: '', org: org)}

      it 'should call gateway' do
        expect(gateway).to receive(:post_message).with('channel abc', 'message abc', '').exactly(1).times
        expect(AuditMessage).to receive(:create).once
        Slack::BroadcastMessageUseCase.new(gateway).execute('channel abc', 'message abc', user)
      end

    end

    describe 'when in simulation mode' do

      let(:user) {double(simulation_mode: true, slack_token: '', org: org)}

      it 'should call gateway' do
        expect(gateway).to receive(:post_message).with('channel abc', 'message abc', '').exactly(0).times
        expect(AuditMessage).to receive(:create).once
        Slack::BroadcastMessageUseCase.new(gateway).execute('channel abc', 'message abc', user)
      end

    end

  end

end
