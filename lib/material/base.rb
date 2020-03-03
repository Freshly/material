# frozen_string_literal: true

module Material
  class Base < Spicerack::AttributeObject
    extend ActiveSupport::NumberHelper

    include Conjunction::Junction
    suffixed_with "Material"

    include Material::Components
    include Material::Core
    include Material::Display
    include Material::Text
    include Material::Site
    include Material::Format
    include Material::Attributes

    register_component :list_item_style

    class << self
      def for(object)
        for_class(object)&.new(object)
      end

      def for_class(object)
        object.try(:conjugate!, self)
      end

      delegate_missing_to :prototype
    end

    def to_source_model
      source.to_model
    end

    def to_model
      self
    end
  end
end
