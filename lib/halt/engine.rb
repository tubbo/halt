module Halt
  # Rails integration.
  class Engine < ::Rails::Engine
    isolate_namespace Halt

    config.halt = ActiveSupport::InheritableOptions.new(
      verbose: false,
      handle_exceptions: true,
      errors: %i[not_found unprocessable_entity internal_server_error]
    )

    initializer 'halt.exception_handling' do
      if config.halt.errors.present?
        config.exceptions_app = Halt::Engine.routes
      end
    end
  end
end
