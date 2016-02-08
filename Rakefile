require 'bundler/setup'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yard'
require 'travis/release/task'

RSpec::Core::RakeTask.new :test

RuboCop::RakeTask.new :lint

YARD::Rake::YardocTask.new :doc

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

Bundler::GemHelper.install_tasks

task default: %w(lint test build doc)
