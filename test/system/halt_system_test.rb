require 'test_helper'

module Halt
  class SystemTest < ActionDispatch::SystemTestCase
    driven_by :selenium, \
              using: :chrome,
              screen_size: [1400, 1400]

    test 'render error page' do
      get halted_path

      assert_text 'Internal Server Error'
    end
  end
end
