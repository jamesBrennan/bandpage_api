require 'spec_helper'

describe Bandpage::Token do
  let(:subject) { Bandpage::Token }

  before do
    @time = Time.now
    Time.stub(:now).and_return(@time)
  end

  describe '.initialize' do
    it 'sets expires_at' do
      token = subject.new('tokenstring', '3600')
      token.expires_at.should eq(@time + 3600)
    end
  end

  describe '#expired' do
    it 'is true if expires_at is a time in the past' do
      token = subject.new('tokenstring', '-3600')
      token.expired?.should be_true
    end
  end
end