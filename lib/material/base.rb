# frozen_string_literal: true

module Material
  class Base < Spicerack::AttributeObject
    include Material::Components
    include Material::Core
    include Material::Icon
    include Material::Text
    include Material::Page
    include Material::For

    def self.for(object)
      material_class_for(object, "Material")
    end
  end
end
