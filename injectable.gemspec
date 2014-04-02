# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'injectable/version'

Gem::Specification.new do |spec|
  spec.name          = "injectable"
  spec.version       = Injectable::VERSION
  spec.authors       = ["Andrei Miulescu"]
  spec.email         = ["lusu777@gmail.com"]
  spec.summary       = %q{Ruby automated initializer injection}
  spec.description   = %q{Initializer injection for all your colaborators, with a bit of magic. This would be usefull in your testing cause you can inject colaborators}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"


end
