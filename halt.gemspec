# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'halt/version'

Gem::Specification.new do |spec|
  spec.name          = 'halt'
  spec.version       = Halt::VERSION
  spec.authors       = ['Tom Scott']
  spec.email         = ['tubbo@psychedeli.ca']

  spec.summary       = 'Standard error handling for Rails applications.'
  spec.description   = "#{spec.summary} Inspired by a little method in Sinatra."
  spec.homepage      = 'https://github.com/tubbo/halt'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |file|
    file.match(/spec/)
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'rails', '~> 5.2'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'travis-release'

  spec.add_dependency 'actionpack'
end
