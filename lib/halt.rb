require 'active_support/all'
require 'json'
require 'i18n'

require 'halt/version'
require 'halt/engine'
require 'halt/error'

# An extension to +ActionController+ which enables standard error
# handling using +ActionView+ and translations.
#
# @api public
# @example
#   class ApplicationController < ActionController::Base
#     include Pundit
#     include Halt
#
#     halt ActiveRecord::RecordNotFound, with: :not_found
#     halt Pundit::NotAuthorizedError, with: :unauthorized
#   end
module Halt
  extend ActiveSupport::Concern

  included do
    class_attribute :halted
    self.halted ||= {}
    alias_method :halt!, :halt
  end

  class_methods do
    def halt(exception, with: :server_error)
      halted[exception] = with
      rescue_from exception, with: :_handle_exception
    end
  end

  def halt(status, **options)
    @error = Error.new(status, **options)

    respond_to do |format|
      format.html { render 'error', status: @error.status, error: @error }
      format.json { render json: @error, status: @error.status }
      format.all  { head @error.status }
    end && return
  end

  private

  def _handle_exception(exception)
    Rails.logger.debug exception.message if Rails.configuration.halt.verbose
    halt self.class.halted[exception.class], exception: exception
  end
end
