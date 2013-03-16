module RailsAdminNestedSet
  class Engine < ::Rails::Engine

    initializer "RailsAdminNestable precompile hook" do |app|
      app.config.assets.precompile += %w(rails_admin/rails_admin_nested_set.js rails_admin/jquery.mjs.nestedSortable.js rails_admin/rails_admin_nested_set.css)
    end

    initializer 'Include RailsAdminNestedSet::Helper' do |app|
      ActionView::Base.send :include, RailsAdminNestedSet::Helper
    end
  end
end
