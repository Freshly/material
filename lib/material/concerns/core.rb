# frozen_string_literal: true

# Material is a component framework for defining the presentation layer of an application
module Material
  module Core
    extend ActiveSupport::Concern

    included do
      attr_reader :source

      delegate :name, to: :class, prefix: true
      delegate :class, to: :source, prefix: true
      delegate :to_param, to: :source
      delegate :attribute_names, :human_attribute_name, :type_for_attribute, to: :source_class

      delegate_missing_to :source
    end

    class_methods do
      private

      def references(field, as:, from: :source)
        delegate field, to: from
        alias_method as, field
      end
    end

    def initialize(object)
      raise ArgumentError, "source is required" if object.nil?

      @source = object
    end
  end
end
