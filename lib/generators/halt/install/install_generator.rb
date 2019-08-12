class Halt::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def delete_static_error_pages
    [404, 422, 500].each do |status|
      remove_file "public/#{status}.html"
    end
  end

  def create_initializer
    template 'initializer.rb', 'config/initializers/halt.rb'
  end
end
