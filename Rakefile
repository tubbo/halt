require 'bundler/setup'
require 'yard'
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'travis/release/task'
require 'rubocop/rake_task'

APP_RAKEFILE = File.expand_path('../test/dummy/Rakefile', __FILE__)
load 'rails/tasks/engine.rake'

RuboCop::RakeTask.new :lint
YARD::Rake::YardocTask.new :doc
Travis::Release::Task.new
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task default: :test
