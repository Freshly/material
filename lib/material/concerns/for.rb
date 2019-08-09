# frozen_string_literal: true

# Build materials from objects based either an explicit definition or an optimistic lookup
module Material
  module For
    extend ActiveSupport::Concern

    class_methods do
      def material_class_for(object, subtype)
        material_class = object.material_class if object.respond_to?(:material_class)
        material_class ||= object.class.material_class if object.class.respond_to?(:material_class)
        material_class ||= "#{object.class.name}#{subtype}".safe_constantize
        material_class
      end
    end
  end
end
