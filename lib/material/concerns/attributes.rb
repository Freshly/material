# frozen_string_literal: true

module Material
  module Attributes
    extend ActiveSupport::Concern

    included do
      memoize :formatted_attributes
    end

    def formatted_attributes
      attribute_names.each_with_object({}) do |attribute_name, hash|
        attribute_type = type_for_attribute(attribute_name)
        attribute_value = public_send(attribute_name.to_sym)
        hash[human_attribute_name(attribute_name)] = format_by_type(attribute_value, type: attribute_type)
      end
    end
  end
end
