# frozen_string_literal: true

require_relative "concerns/components"
require_relative "concerns/core"
require_relative "concerns/icon"

module Material
  class Base < Spicerack::AttributeObject
    include Material::Components
    include Material::Core
    include Material::Icon
  end
end
