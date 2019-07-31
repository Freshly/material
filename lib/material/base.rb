# frozen_string_literal: true

require_relative "concerns/core"
require_relative "concerns/components"

module Material
  class Base < Spicerack::AttributeObject
    include Material::Core
    include Material::Components
  end
end
