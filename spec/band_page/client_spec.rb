require 'spec_helper'
require 'api_responses'

describe BandPage::Client do
  let(:subject) {
    BandPage::Client.new(config)
  }

  let(:config) {
    BandPage::Config.new(
      app_id: '1',
      client_id: '2a',
      secret_key: '3b',
      band_id: '2'
    )
  }

  before do
    subject.token = BandPage::Token.new('sometoken', 5000)
  end

  describe 'connections' do
    it 'creates a method for each connection which delegates to get' do
      BandPage::Client::CONNECTIONS.each do |connection|
        subject.should_receive(:get).with(connection)
        subject.send(connection)
      end
    end
  end

  # This is a stand in for any of the connection methods
  # they all behave the same
  describe '.tracks' do
    before do
      FakeWeb.register_uri(:get, subject.send(:url, :tracks),
                           response: BandPage::RecordedApiResponses.tracks)
    end
    it 'returns tracks' do
      subject.tracks.first.type.should == "Track"
    end
  end

  context '401' do
    before do
      FakeWeb.register_uri(:get, subject.send(:url, :tracks),
                            body: "{'error':'invalid_token','error_description':'Invalid token signature'}",
                            status: ['401', 'UNAUTHORIZED'])
    end

    it 'raises an authorization error' do
      expect {
        subject.tracks
      }.to raise_error(BandPage::AuthorizationError)
    end
  end

  context '404' do
    before do
      FakeWeb.register_uri(:get, subject.send(:url, :tracks),
                           response: BandPage::RecordedApiResponses.not_found)
    end

    it 'raises a resource not found error' do
      expect {
        subject.tracks
      }.to raise_error(BandPage::ResourceNotFoundError)
    end
  end

  context '500' do
    before do
      FakeWeb.register_uri(:get, subject.send(:url, :tracks),
                           response: BandPage::RecordedApiResponses.server_error)
    end

    it 'raises a server error' do
      expect {
        subject.tracks
      }.to raise_error(BandPage::ServerError)
    end
  end

  context '503' do
    before do
      FakeWeb.register_uri(:get, subject.send(:url, :tracks),
                           response: BandPage::RecordedApiResponses.service_unavailable)
      it 'reases a service unavailable error' do
        expect {
          subject.tracks
        }.to raise_error(BandPage::ServiceUnavailableError)
      end
    end
  end

end

