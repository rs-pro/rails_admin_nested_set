# RailsAdminNestedSet

It looks and feels exactly like https://github.com/dalpo/rails_admin_nestable but uses jquery Nested Sortable and https://github.com/collectiveidea/awesome_nested_set or `mongoid_nested_set` instead of `Nestable` and `Ancestry`.

Designed and tested with https://github.com/55ideas/mongoid_nested_set but
should also work with awesome_nested_set (untested)

mongoid_nested_set users: use GIT version for new Mongoid!

## Installation

Add this line to your application's Gemfile:

    gem 'rails_admin_nested_set'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_admin_nested_set

## Usage with rails_admin

Add the nested_set action for each model or only for models you need

    RailsAdmin.config do |config|
      config.actions do
        ......
        nested_set do
          visible do
            %w(Page).include? bindings[:abstract_model].model_name
          end
        end
      end
    end

In model:

    acts_as_nested_set
    rails_admin do
        ...
        nested_set({
            max_depth: 1
        })
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Some ideas and code for this gem are taken from:

https://github.com/dalpo/rails_admin_nestable (MIT license)

https://github.com/the-teacher/the_sortable_tree (MIT license)

## License

(c) 2013 http://rocketscience.pro

MIT license
