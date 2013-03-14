module RailsAdminNestedSet
  class Engine < ::Rails::Engine
    initializer 'Include RailsAdminNestedSet::Helper' do |app|
      ActionView::Base.send :include, RailsAdminNestedSet::Helper
    end
  end
end
