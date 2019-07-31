# frozen_string_literal: true

# Components are value objects which abstract the storage of configuration data for various parts of a material.
module Material
  module Components
    extend ActiveSupport::Concern

    included do
      class_attribute :_components, instance_writer: false, default: {}
    end

    class_methods do
      def inherited(base)
        dup = _components.dup
        base._components = dup.each { |k, v| dup[k] = v.dup }
        super
      end

      private

      def register_component(key, **options, &block)
        _components[key] = Component.new(**options, &block)
        define_component_configurator(key)
        define_component_reader(key)
        define_component_value_reader(key)
      end

      def define_component_configurator(key)
        define_singleton_method("define_#{key}".to_sym) do |**options, &block|
          _components[key].configure(**options, &block)
        end
      end

      def define_component_reader(key)
        define_singleton_method("#{key}_component".to_sym) { _components[key] }
      end

      def define_component_value_reader(key)
        define_method(key) { _components[key].value_for(self) }
      end
    end

    class Component
      attr_reader :options

      def initialize(**options, &block)
        @options = {}
        configure(**options, &block)
      end

      def value_for(object)
        object.instance_eval(&@value).dup if @value.respond_to?(:call)
      end

      def configure(**opts, &block)
        @value = block if block_given?
        options.merge!(**opts)
      end
    end
  end
end
