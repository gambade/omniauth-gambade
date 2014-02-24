# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/gambade/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-gambade"
  spec.version       = Omniauth::Gambade::VERSION
  spec.authors       = ["malickcisse"]
  spec.email         = ["malick.cisse@gambade.co"]
  spec.summary       = %q{Omniauth strategy to connect to gambade apps}
  spec.description   = %q{Omniauth strategy to connect to gambade apps}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_dependency "omniauth"
end
