# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_admin_nested_set/version'

Gem::Specification.new do |gem|
  gem.name          = "rails_admin_nested_set"
  gem.version       = RailsAdminNestedSet::VERSION
  gem.authors       = ["Gleb Tv"]
  gem.email         = ["glebtv@gmail.com"]
  gem.description   = %q{Rails admin nested set}
  gem.summary       = %q{Interface for editing a nested set for rails_admin}
  gem.homepage      = "https://gitlab.com/rocket-science/rails_admin_nested_set"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rails_admin'
  gem.add_dependency 'rails', '>= 4.1.0'
end

