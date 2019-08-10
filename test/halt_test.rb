require 'test_helper'

module Halt
  class Test < ActiveSupport::TestCase
    class Controller < ActionController::Base
      include Halt
    end

    test 'extends controller to provide `halt` methods' do
      assert_respond_to Controller, :halt
      assert_respond_to Controller, :halted
      assert_respond_to Controller.new, :halt
    end

    test 'calling halt on the class level adds to halted' do
      Controller.halt StandardError, with: :not_found

      assert_equal :not_found, Controller.halted[StandardError]
    end
  end
end
