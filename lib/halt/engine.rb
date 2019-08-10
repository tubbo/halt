module Halt
  # Rails integration.
  class Engine < ::Rails::Engine
    isolate_namespace Halt

    config.halt = ActiveSupport::InheritableOptions.new(
      verbose: !Rails.env.production?
    )
  end
end
