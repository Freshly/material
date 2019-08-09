# frozen_string_literal: true

require_relative "concerns/components"
require_relative "concerns/icon"
require_relative "concerns/text"

module Material
  class List < Collectible::CollectionBase
    include Material::Components
    include Material::Icon
    include Material::Text
    include Material::Page
    include Material::For

    def self.for(object)
      material_class = material_class_for(object, "List")
      return unless material_class.present?

      material_class.new(object)
    end

    def default_title
      (item_class.try(:model_name)&.human || item_class&.name).pluralize || self.class.name
    end
  end
end
