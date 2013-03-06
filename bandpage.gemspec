# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'band_page/version'

Gem::Specification.new do |gem|
  gem.name          = "band_page"
  gem.version       = BandPage::VERSION
  gem.authors       = ["James Brennan"]
  gem.email         = ["james@carbonfive.com", "brennanmusic@gmail.com"]
  gem.description   = 'Wrapper for BandPage API'
  gem.summary       = 'Wrapper for BandPage API - https://developers.bandpage.com/docs'
  gem.homepage      = "https://github.com/jamesBrennan/bandpage_api"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('httparty')
  gem.add_dependency('recursive-open-struct')
  gem.add_development_dependency('fakeweb')
end
