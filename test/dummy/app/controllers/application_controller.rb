class ApplicationController < ActionController::Base
  include Halt

  class CommonError < StandardError; end

  halt CommonError, with: :unprocessable_entity

  def index
    head :ok
  end

  def halted
    halt :server_error
  end

  def missing
    halt :not_found
  end

  def exception
    raise CommonError, 'some message'
  end
end
