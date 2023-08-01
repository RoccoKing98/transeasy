# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'transeasy/version'

Gem::Specification.new do |spec|
  spec.name          = 'transeasy'
  spec.version       = Transeasy::VERSION
  spec.summary       = 'Translate your text easily'
  spec.description   = 'Translate your text easily'
  spec.authors       = ['Rocco King']
  spec.email         = 'primal.rots_0c@icloud.com'
  spec.homepage      = 'https://transeasy.net'
  spec.license       = 'MIT'
  spec.files         = Dir['{app, config, lib}/**/*', 'transeasy.gemspec', 'Gemfile', 'README.md']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '3.0'

  spec.add_dependency 'bootstrap', '>=5.2'
  spec.add_dependency 'papertrail'
  spec.add_dependency 'rails', '>=7.0'
  spec.add_dependency 'slim'

  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'minitest_change_assertions'
  spec.add_development_dependency 'rails-controller-testing'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'sqlite3'

end
