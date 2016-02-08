require 'spec_helper'
require 'action_controller'

RSpec.describe Halt do
  class Controller < ActionController::Base
    include Halt
  end

  subject { Controller.new }

  it 'extends controller to provide `halt` methods' do
    expect(Controller).to respond_to(:halt)
    expect(Controller).to respond_to(:halted)
    expect(subject).to respond_to(:halt)
  end
end
