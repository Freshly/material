# frozen_string_literal: true

require_relative "concerns/components"
require_relative "concerns/icon"
require_relative "concerns/text"

module Material
  class List < Collectible::CollectionBase
    include Material::Components
    include Material::Icon
    include Material::Text
    include Material::Site
    include Material::For
    include Material::Pagination
    include Material::Mount

    class << self
      def for(object)
        material_class = material_class_for(object, "List")
        material_class.new if material_class.present?
      end

      def item_class
        return item_enforcement if item_enforcement.is_a?(Class)

        item_class = superclass.__send__(:item_enforcement) if superclass.respond_to?(:item_enforcement, true)
        return item_class if item_class.present?

        # Prevents against the case of `Material::List` becoming `Material` and returning a module
        item_class = name.chomp("List").safe_constantize
        item_class if item_class.is_a?(Class)
      end

      def ensure_item_validity_with
        super || item_class
      end
    end

    def default_title
      (item_class.try(:model_name)&.human || item_class&.name).pluralize || self.class.name
    end
  end
end
