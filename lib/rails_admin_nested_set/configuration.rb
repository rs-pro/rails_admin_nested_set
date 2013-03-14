module RailsAdminNestedSet
  class Configuration
    def initialize(abstract_model)
      @abstract_model = abstract_model
    end

    def options
      @options ||= {
          max_depth: 1,
      }.merge(config)

      @options || {}
    end

    protected
    def config
      ::RailsAdmin::Config.model(@abstract_model.model).nested_set
    end
  end
end
