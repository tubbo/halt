require 'test_helper'

class Halt::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Halt
  end
end
