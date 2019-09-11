# frozen_string_literal: true

module Material
  module Attributes
    extend ActiveSupport::Concern

    included do
      delegate :head_attributes, :tail_attributes, to: :class

      memoize :attribute_values
      memoize :attribute_types
      memoize :formatted_attributes
      memoize :sorted_attribute_names
      memoize :relationship_attributes
    end

    class_methods do
      def head_attributes
        %w[id]
      end

      def tail_attributes
        %w[created_at updated_at]
      end
    end

    def human_attribute_value(attribute)
      formatted_attributes.fetch(attribute)
    end

    def attribute_values
      attribute_names.each_with_object({}) { |attribute, hash| hash[attribute] = public_send(attribute.to_sym) }
    end

    def attribute_types
      attribute_names.each_with_object({}) { |attribute, hash| hash[attribute] = type_for_attribute(attribute) }
    end

    def formatted_attributes
      attribute_types.each_with_object({}) do |(attribute, attribute_type), hash|
        hash[attribute] = format_by_type(attribute_values[attribute], type: attribute_type)
      end
    end

    def sorted_attribute_names
      [
        (head_attributes & attribute_names),
        (attribute_names - head_attributes - tail_attributes).sort,
        (tail_attributes & attribute_names),
      ].flatten
    end

    def relationship_attributes
      source_class.reflect_on_all_associations.map(&:foreign_key)
    end
  end
end
