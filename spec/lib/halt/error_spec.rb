require 'spec_helper'

module Halt
  RSpec.describe Error do
    let(:description) { I18n.t :server_error, scope: Error::DESCRIPTIONS }
    let(:translation) { I18n.t :server_error, scope: Error::MESSAGES }
    let(:exception) { StandardError.new 'Standard Error' }
    subject { described_class.new :server_error, exception: exception }

    before do
      I18n.load_path += Dir[
        File.join(
          File.expand_path('../../../../', __FILE__),
          'config', 'locales', '*.yml'
        )
      ]
    end

    it 'uses exception for message' do
      expect(subject.message).to eq 'Internal Server Error'
      expect(subject.message).not_to match 'translation missing'
    end

    it 'uses i18n for description' do
      expect(subject.description).to eq description
      expect(subject.description).not_to match 'translation missing'
    end

    it 'allows message to be translated' do
      subject.message = nil
      expect(subject.message).not_to be_blank
      expect(subject.message).to eq translation
    end

    it 'allows description to be overwritten' do
      subject.description = 'custom error text'
      expect(subject.description).to eq 'custom error text'
    end
  end
end
