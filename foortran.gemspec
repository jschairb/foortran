# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foortran/version'

Gem::Specification.new do |gem|
  gem.name          = "foortran"
  gem.version       = Foortran::VERSION
  gem.authors       = ["Josh Schairbaum"]
  gem.email         = ["joshua.schairbaum@gmail.com"]
  gem.description   = %q{A Fortran90 VM}
  gem.summary       = %q{A Fortran90 VM}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'treetop'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
