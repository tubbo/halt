module Halt
  # Error object to house the translation logic and exception/status
  # information passed in when +halt+ has been called or an exception is
  # being rescued.
  #
  # @api private
  class Error
    MESSAGES = 'halt.errors.messages'
    DESCRIPTIONS = 'halt.errors.descriptions'

    delegate :to_json, to: :attributes
    delegate :message, to: :exception, prefix: true, allow_nil: true

    attr_accessor :status
    attr_accessor :exception

    attr_writer :message
    attr_writer :description

    # @param [Symbol] status
    # @keyword [Exception] exception
    # @keyword [String] message
    # @keyword [String] description
    def initialize(status, exception: nil, message: nil, description: nil)
      @status = status
      @exception = exception
      @message = message
      @description = description
    end

    # @return [String]
    def message
      @message ||= translate MESSAGES
    end

    # @return [String]
    def description
      @description ||= translate DESCRIPTIONS
    end

    # @return [Hash]
    def attributes
      {
        status: status,
        message: message,
        description: description
      }
    end

    private

    # @private
    # @param [String] key
    def translate(scope)
      I18n.translate status, scope: scope
    end
  end
end
