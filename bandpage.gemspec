# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bandpage/version'

Gem::Specification.new do |gem|
  gem.name          = "bandpage"
  gem.version       = Bandpage::VERSION
  gem.authors       = ["James Brennan"]
  gem.email         = ["james@carbonfive.com", "brennanmusic@gmail.com"]
  gem.description   = 'Wrapper for BandPage API'
  gem.summary       = 'Wrapper for BandPage API'
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('httparty')
  gem.add_dependency('recursive-open-struct')
  gem.add_development_dependency('fakeweb')
end
