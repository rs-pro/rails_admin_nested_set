module RailsAdminNestedSet
  class Configuration
    def initialize(abstract_model)
      @abstract_model = abstract_model
    end

    def options
      @options ||= {
          max_depth: 3,
          toggle_fields: [:enabled],
          thumbnail_fields: [:image, :cover],
          thumbnail_size: :thumb,
          thumbnail_gem: :paperclip,
          scopes: []
      }.merge(config || {})
    end

    protected
    def config
      ::RailsAdmin::Config.model(@abstract_model.model).nested_set || {}
    end
  end
end

