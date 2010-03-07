# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{styled_inputs}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Pfeifer"]
  s.date = %q{2010-03-07}
  s.description = %q{Adds automated styling of input fields with css classes in Rails}
  s.email = %q{aaron@pluginaweek.org}
  s.files = ["lib/styled_inputs.rb", "lib/styled_inputs", "lib/styled_inputs/extensions", "lib/styled_inputs/extensions/instance_tag.rb", "lib/styled_inputs/extensions/tag_helper.rb", "test/test_helper.rb", "test/helpers", "test/helpers/form_helper_test.rb", "test/helpers/styled_inputs_test.rb", "test/helpers/date_helper_test.rb", "test/helpers/form_tag_helper_test.rb", "test/helpers/tag_helper_test.rb", "CHANGELOG.rdoc", "init.rb", "LICENSE", "Rakefile", "README.rdoc"]
  s.homepage = %q{http://www.pluginaweek.org}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pluginaweek}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Adds automated styling of input fields with css classes in Rails}
  s.test_files = ["test/helpers/form_helper_test.rb", "test/helpers/styled_inputs_test.rb", "test/helpers/date_helper_test.rb", "test/helpers/form_tag_helper_test.rb", "test/helpers/tag_helper_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
