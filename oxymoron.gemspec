# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'oxymoron/version'

Gem::Specification.new do |spec|
  spec.name          = "oxymoron"
  spec.version       = Oxymoron::VERSION
  spec.authors       = ["Cesar Camacho"]
  spec.email         = ["chanko@gmail.com"]
  spec.summary       = %q{Create a local copy of a remote file}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
  spec.add_development_dependency "guard", "~> 2.12.5"
  spec.add_development_dependency "guard-rspec", "~> 4.5.0"
  spec.add_development_dependency "pry-byebug", "~> 3.1.0"
end
