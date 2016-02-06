module Halt
  # Error object to house the translation logic and exception/status
  # information passed in when +halt+ has been called or an exception is
  # being rescued.
  #
  # @api private
  class Error
    delegate :to_json, to: :attributes

    # @param [Symbol] status
    # @keyword [Exception] exception
    # @keyword [String] message
    # @keyword [String] description
    def initialize(status, exception: nil, message: nil, description: nil)
      @status = status
      @exception = exception
      @message = message || exception.message
      @description = description
    end

    # @return [String]
    def message
      @message ||= translate 'messages'
    end

    # @return [String]
    def description
      @description ||= translate 'descriptions'
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
    def translate(key)
      I18n.translate key, scope: "halt.errors.#{key}"
    end
  end
end
