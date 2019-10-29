# frozen_string_literal: true

module Material
  class Base < Spicerack::AttributeObject
    extend ActiveSupport::NumberHelper

    include Material::Components
    include Material::Core
    include Material::Display
    include Material::Text
    include Material::Site
    include Material::Format
    include Material::Attributes

    register_component :list_item_style

    class << self
      delegate :for, :class_for, to: :class_finder

      private

      def class_finder
        @_class_finder ||= Spicerack::ClassFinder.new("Material")
      end
    end

    def to_source_model
      source.to_model
    end

    def to_model
      self
    end
  end
end
