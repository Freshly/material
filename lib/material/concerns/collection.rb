# frozen_string_literal: true

module Material
  module Collection
    extend ActiveSupport::Concern

    included do
      delegate :item_class, to: :class
      delegate :model_name, to: :item_class
    end

    class_methods do
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

    def to_ary
      ary = super
      return ary if ary.empty?

      material_class = self.class.material_class_for(ary.first, "Material")
      material_class.nil? ? ary : ary.map(&material_class.method(:new))
    end
  end
end
