Gem::Specification.new do |spec|
  spec.name          = "transeasy"
  spec.version       = "0.0.1"
  spec.summary       = "Translate your text easily"
  spec.description   = "Translate your text easily"
  spec.authors       = ["Rocco King"]
  spec.email         = "primal.rots_0c@icloud.com"
  spec.files         = ["lib/transeasy.rb"]
  spec.homepage      = "https://transeasy.net"
  spec.license       = "MIT"
  spec.files         = Dir["{app, confif, lib}/**/*", "transeasy.gemspec", "Gemfile", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency  "rails", ">=7.0"
  spec.add_dependency  "bootstrap", ">=5.2"
end

