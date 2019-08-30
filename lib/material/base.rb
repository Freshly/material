# frozen_string_literal: true

module Material
  class Base < Spicerack::AttributeObject
    include Material::Components
    include Material::Core
    include Material::Icon
    include Material::Text
    include Material::Site
    include Material::For

    def self.for(object)
      material_class = material_class_for(object, "Material")
      material_class.new(object) if material_class.present?
    end
  end
end
