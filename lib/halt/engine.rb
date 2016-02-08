module Halt
  # Rails integration.
  class Engine < ::Rails::Engine
    isolate_namespace Halt
  end
end
