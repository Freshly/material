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
        define_component_predicate(key)
      end

      def define_component_configurator(key)
        define_singleton_method("define_#{key}".to_sym) do |**options, &block|
          _components[key].configure(**options, &block)
        end
      end

      def define_component_reader(key)
        method_name = "#{key}_component".to_sym
        define_singleton_method(method_name) { _components[key] }
        delegate method_name, to: :class
      end

      def define_component_value_reader(key)
        method_name = "#{key}_value".to_sym
        define_method(method_name) { _components[key].value_for(self) }
        memoize method_name
        alias_method key, method_name unless method_defined?(key)
      end

      def define_component_predicate(key)
        method_name = "#{key}_value?".to_sym
        define_method(method_name) { public_send("#{key}_value".to_sym).present? }
        alias_method "#{key}?".to_sym, method_name
      end
    end

    class Component
      attr_reader :options

      def initialize(**options, &block)
        @options = {}
        configure(**options, &block)
      end

      def value_for(object)
        value = object.instance_eval(&@value) if @value.respond_to?(:call)
        value.is_a?(Class) ? value : value.dup if value.present?
      end

      def configure(**opts, &block)
        @value = block if block_given?
        options.merge!(**opts)
      end

      def initialize_copy(other)
        super
        @options = @options.dup
        @value = @value.dup if @value.present?
      end
    end
  end
end
