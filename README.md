# NestedSetUi

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'rails_admin_nested_set'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_admin_nested_set

## Usage with rails_admin

Add to /app/assets/javascripts/rails_admin/custom/ui.coffee

    #= require rails_admin_nested_set

Add to /app/assets/stylesheets/rails_admin/custom/theming.sass

    @import rails_admin_nested_set.css.scss

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