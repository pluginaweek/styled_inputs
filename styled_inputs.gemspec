$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'styled_inputs/version'

Gem::Specification.new do |s|
  s.name              = "styled_inputs"
  s.version           = StyledInputs::VERSION
  s.authors           = ["Aaron Pfeifer"]
  s.email             = "aaron@pluginaweek.org"
  s.homepage          = "http://www.pluginaweek.org"
  s.description       = "Adds automated styling of input fields with css classes in Rails"
  s.summary           = "Automated input styled in Rails"
  s.require_paths     = ["lib"]
  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- test/*`.split("\n")
  s.rdoc_options      = %w(--line-numbers --inline-source --title styled_inputs --main README.rdoc)
  s.extra_rdoc_files  = %w(README.rdoc CHANGELOG.rdoc LICENSE)
end
