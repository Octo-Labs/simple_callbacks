# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_callbacks/version'

Gem::Specification.new do |gem|
  gem.name          = "simple_callbacks"
  gem.version       = SimpleCallbacks::VERSION
  gem.authors       = ["Jeremy Green"]
  gem.email         = ["jeremy@octolabs.com"]
  gem.description   = %q{Create, update and validate callbacks for AWS::Record::Model.}
  gem.summary       = %q{Create, update and validate callbacks for AWS::Record::Model.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "aws-sdk", "~> 1.8.0"
  gem.add_dependency "activesupport", "~> 3.2.0"
  gem.add_dependency "activemodel", "~> 3.2.0"
  gem.add_development_dependency "rspec", ">= 2.0.0"
end
