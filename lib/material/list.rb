# frozen_string_literal: true

require_relative "concerns/components"
require_relative "concerns/icon"
require_relative "concerns/text"

module Material
  class List < Collectible::CollectionBase
    include Material::Components
    include Material::Icon
    include Material::Text

    def default_title
      (item_class.try(:model_name)&.human || item_class&.name).pluralize || self.class.name
    end
  end
end
