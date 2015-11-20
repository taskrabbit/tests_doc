# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tests_doc/version'

Gem::Specification.new do |spec|
  spec.name          = "tests_doc"
  spec.version       = TestsDoc::VERSION
  spec.authors       = ["Jean-Richard Lai"]
  spec.email         = ["jrichardlai@gmail.com"]
  spec.description   = %q{This library allow to output requests specs into readable markdown files}
  spec.summary       = %q{Rspec requests file to markdown}
  spec.homepage      = "https://github.com/taskrabbit/tests_doc"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", '~> 4.0'
  spec.add_dependency "rspec", '~> 2.14'
  spec.add_dependency "rspec-rails", '~> 2.14'
end
