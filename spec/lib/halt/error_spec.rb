require 'spec_helper'

module Halt
  RSpec.describe Error do
    let(:message) { 'There was an error' }
    let(:description) { I18n.t :server_error, scope: Error::DESCRIPTIONS }
    let(:exception) { StandardError.new message }
    subject { described_class.new :server_error, exception: exception }

    it 'uses exception for message' do
      expect(subject.message).to eq message
    end

    it 'uses i18n for description' do
      expect(subject.description).to eq description
    end
  end
end
