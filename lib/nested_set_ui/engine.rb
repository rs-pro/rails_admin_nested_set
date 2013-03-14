module NestedSetUi
  class Engine < ::Rails::Engine
    initializer 'Include NestedSetUi::Helper' do |app|
      ActionView::Base.send :include, NestedSetUi::Helper
    end
  end
end
