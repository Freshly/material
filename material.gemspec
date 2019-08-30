
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "material/version"

Gem::Specification.new do |spec|
  spec.name          = "material"
  spec.version       = Material::VERSION
  spec.authors       = [ "Eric Garside" ]
  spec.email         = %w[garside@gmail.com]

  spec.summary       = "Wrap your records with a presentation layer without cannibalizing view responsibility."
  spec.description   = "An extensible and lightweight object which defines how your objects are viewed."
  spec.homepage      = "https://github.com/Freshly/material"
  spec.license       = "MIT"

  spec.files         = Dir["README.md", "LICENSE.txt", "lib/**/{*,.[a-z]*}"]
  spec.require_paths = "lib"

  spec.add_runtime_dependency "activesupport", "~> 5.2.1"
  spec.add_runtime_dependency "spicerack", ">= 0.16.2", "< 1.0"

  spec.add_development_dependency "bundler", "~> 2.0.1"
  spec.add_development_dependency "faker", "~> 1.8"
  spec.add_development_dependency "pry-byebug", ">= 3.7.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.16"
  spec.add_development_dependency "timecop", ">= 0.9.1"

  spec.add_development_dependency "rspice", ">= 0.16.2", "< 1.0"
  spec.add_development_dependency "spicerack-styleguide", ">= 0.16.2", "< 1.0"
  spec.add_development_dependency "shoulda-matchers", "4.0.1"
end
