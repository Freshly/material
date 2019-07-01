# frozen_string_literal: true

require_relative "concerns/core"

module Material
  class Base < Spicerack::AttributeObject
    include Material::Core
  end
end
