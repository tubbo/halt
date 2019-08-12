require 'test_helper'
require 'webdrivers'
require 'capybara'

Capybara.server = :puma, { Silent: true }

module Halt
  class SystemTest < ActionDispatch::SystemTestCase
    driven_by :selenium,
      using: :chrome,
      screen_size: [1400,1400],
      options: { args: %i[headless disable-gpu] }

    test 'render error page' do
      visit halted_path

      assert_text 'Internal Server Error'
    end
  end
end
