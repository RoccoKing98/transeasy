# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'transeasy/version'

Gem::Specification.new do |spec|
  spec.name          = 'transeasy'
  spec.version       = Transeasy::VERSION
  spec.summary       = 'Translate your text easily'
  spec.description   = 'Translate your text easily as a gem'
  spec.authors       = ['Rocco King']
  spec.email         = 'primal.rots_0c@icloud.com'
  spec.homepage      = 'https://transeasy.net'
  spec.license       = 'MIT'
  spec.files         = Dir['{app, config, lib}/**/*', 'transeasy.gemspec', 'Gemfile', 'README.md']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.7'

  spec.add_dependency 'bootstrap', '~> 5.2'
  spec.add_dependency 'papertrail', '~> 0.11.2'
  spec.add_dependency 'rails', '~>7.0'
  spec.add_dependency 'slim', '~> 5.1'

  spec.add_development_dependency 'database_cleaner', '~> 2.0', '>= 2.0.2'
  spec.add_development_dependency 'factory_bot_rails', '~> 6.2'
  spec.add_development_dependency 'faker', '~> 3.2', '>= 3.2.1'
  spec.add_development_dependency 'minitest_change_assertions', '~> 1.0', '>= 1.0.1'
  spec.add_development_dependency 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  spec.add_development_dependency 'rspec-rails', '~> 6.0', '>= 6.0.3'
  spec.add_development_dependency 'rubocop', '~> 1.56', '>= 1.56.4'
  spec.add_development_dependency 'rubocop-factory_bot', '~> 2.24'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.24', '>= 2.24.1'
  spec.add_development_dependency 'sqlite3', '~> 1.6', '>= 1.6.6'
end
