require 'test_helper'

module Halt
  class ErrorTest < ActiveSupport::TestCase
    setup do
      I18n.load_path += Dir[
        File.join(
          File.expand_path('../../../../', __FILE__),
          'config', 'locales', '*.yml'
        )
      ]

      @message = I18n.t :server_error, scope: Error::MESSAGES
      @description = I18n.t :server_error, scope: Error::DESCRIPTIONS
      @exception = StandardError.new 'Standard Error'
      @error = Error.new(:server_error, exception: @exception)
    end

    test 'uses exception for message' do
      assert_equal @message, @error.message
    end

    test 'uses i18n for description' do
      assert_equal @description, @error.description
    end

    test 'translates message when not supplied' do
      @error.message = nil

      assert_equal @message, @error.message
    end

    test 'allows description to be overwritten' do
      @error.description = 'custom error text'

      assert_equal 'custom error text', @error.description
    end

    test 'overwrite message' do
      @error.message = 'custom message'

      assert_equal 'custom message', @error.message
    end
  end
end
