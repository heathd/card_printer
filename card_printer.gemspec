# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'card_printer/version'

Gem::Specification.new do |spec|
  spec.name          = "card_printer"
  spec.version       = CardPrinter::VERSION
  spec.authors       = ["David Heath"]
  spec.email         = ["david@davidheath.org"]
  spec.description   = %q{Produce nicely formatted PDFs of story cards for printing}
  spec.summary       = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "prawn", "~> 1.3.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
