require 'rails_helper'

describe Github::GetStatsUseCase do

  describe 'when gathering stats' do

    let(:gateway) {
      double(
        get_repos: [{'url' => 'http://'}],
        get_pull_requests: [
          {
            'title' => 'example title',
            'url' => 'http://',
            'created_at' => '2018-01-01T00:00:00Z',
            'closed_at' => '2018-01-01T01:00:00Z',
            '_links' => {'comments' => {'href' => 'http://'}}
          }
        ],
        get_files: [{'changes' => 1}],
        get_comments: [{}],
        )
    }
    let(:users) {
      [double(github_token: '', org: double(id: 1, url: 'http://...'))]
    }

    describe 'when complete' do

      it 'should return an access token' do
        allow(User).to receive(:all).and_return(users)
        expect(Stat).to receive(:create).with(
          title: 'example title',
          url: 'http://',
          created: '2017-12-31'.to_date,
          closed: '2017-12-31'.to_date,
          hours: 1,
          change_count: 1,
          comments: 1,
          org_id: 1
        ).once
        Github::GetStatsUseCase.new(gateway).execute
      end

    end
  end

end
