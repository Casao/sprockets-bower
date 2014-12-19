# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprockets/bower/version'

Gem::Specification.new do |spec|
  spec.name          = "sprockets-bower"
  spec.version       = Sprockets::Bower::VERSION
  spec.authors       = ["Colin Ewen"]
  spec.email         = ["colin@draecas.com"]
  spec.summary       = %q{Add the bower directory to Sprockets asset_path}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "sprockets"
end
