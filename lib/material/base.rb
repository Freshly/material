# frozen_string_literal: true

module Material
  class Base < Spicerack::AttributeObject
    include Material::Components
    include Material::Core
    include Material::Icon
    include Material::Text
    include Material::Page
  end
end
