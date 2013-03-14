# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_admin_nested_set/version'

Gem::Specification.new do |gem|
  gem.name          = "nested_set_ui"
  gem.version       = NestedSetUi::VERSION
  gem.authors       = ["Gleb Tv"]
  gem.email         = ["glebtv@gmail.com"]
  gem.description   = %q{Rails admin nested set}
  gem.summary       = %q{Interface for editing a nested set for rails_admin}
  gem.homepage      = "https://github.com/rs-pro/rails_admin_nested_set"

  gem.add_dependency "rails", ">= 3.1"
  gem.add_dependency "jquery-rails"
  gem.add_dependency "jquery-ui-rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
