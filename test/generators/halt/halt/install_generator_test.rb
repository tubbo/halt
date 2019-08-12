require 'test_helper'
require 'generators/halt/install/install_generator'

module Halt
  class Halt::InstallGeneratorTest < Rails::Generators::TestCase
    tests Halt::InstallGenerator
    destination Rails.root.join('tmp/generators')

    setup :prepare_destination
    setup :create_default_files
    setup { run_generator [] }

    test 'deletes static html error files and creates initializer' do
      refute_file destination_root.join('public', '404.html')
      refute_file destination_root.join('public', '422.html')
      refute_file destination_root.join('public', '500.html')
    end

    test 'creates initializer configuration' do
      initializer = destination_root.join('config', 'initializers', 'halt.rb')
      assert_file initializer, <<~RUBY
        Rails.application.configure do
          # Enable to configure logging
          # config.halt.verbose = true

          # Add or remove error states (default: :not_found, :unprocessable_entity,
          # :internal_server_error). To disable this, set `errors` to `nil` or
          # `[]`.
          # config.halt.errors << :method_not_allowed

          # Set the time period cache is valid for
          # config.halt.cache_expiry = 1.year
        end
      RUBY
    end

    private

    def create_default_files
      FileUtils.mkdir_p destination_root.join('public')
      FileUtils.touch destination_root.join('public', '404.html')
      FileUtils.touch destination_root.join('public', '422.html')
      FileUtils.touch destination_root.join('public', '500.html')
    end

    def refute_file(path)
      refute path.exist?, "Expected no file to exist at #{path}."
    end
  end
end
