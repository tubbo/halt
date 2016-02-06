require 'spec_helper'

RSpec.describe Halt do
  class Controller < ActionController::Base
    include Halt

    halt StandardError

    def index
      raise StandardError, "Error message"
    end
  end

  subject { Controller.new }

  it 'renders error object'
end
