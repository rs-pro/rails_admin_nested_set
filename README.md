# RailsAdminNestedSet

Master repository has moved to gitlab, all new code will be there:

https://gitlab.com/rocket-science/rails_admin_nested_set

It looks and feels exactly like [rails_admin_nestable](https://github.com/dalpo/rails_admin_nestable) but uses jquery Nested Sortable and
[awesome_nested_set](https://github.com/collectiveidea/awesome_nested_set) or [glebtv-mongoid_nested_set](https://github.com/glebtv/mongoid_nested_set) instead of `Nestable` and `Ancestry`.

Works with [glebtv-mongoid_nested_set](https://github.com/glebtv/mongoid_nested_set) and awesome_nested_set.

Bonus features:

* special case support for `enabled` column with rails_admin_toggleable
* special case support for `cover` and `image` columns

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
            max_depth: 1,
            toggle_fields: [:enabled],
            thumbnail_fields: [:image, :cover],
            thumbnail_size: :thumb,
            thumbnail_gem: :paperclip, # or :carrierwave
            scopes: [:enabled, :disabled] # filter nodes by scope
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
