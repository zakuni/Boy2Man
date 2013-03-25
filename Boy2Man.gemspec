# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Boy2Man/version'

Gem::Specification.new do |spec|
  spec.name          = "Boy2Man"
  spec.version       = Boy2Man::VERSION
  spec.authors       = ["zakuni"]
  spec.email         = ["kunio038@gmail.com"]
  spec.description   = %q{A game and library of Rock Paper Scissors}
  spec.summary       = %q{Rock Paper Scissors}
  spec.homepage      = "https://github.com/zakuni/Boy2Man"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
