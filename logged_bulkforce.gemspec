# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logged_bulkforce/version'

Gem::Specification.new do |spec|
  spec.name          = "logged_bulkforce"
  spec.version       = LoggedBulkforce::VERSION
  spec.authors       = ["Leif Gensert"]
  spec.email         = ["leif@leif.io"]

  spec.summary       = %q{Just a little wrapper around Bulkforce}
  spec.homepage      = "https://github.com/leifg/logged_bulkforce"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bulkforce", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
