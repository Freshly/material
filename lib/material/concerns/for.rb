# frozen_string_literal: true

# Build materials from objects based either an explicit definition or an optimistic lookup
module Material
  module For
    extend ActiveSupport::Concern

    class_methods do
      def material_class_for(object, subtype)
        method = "#{subtype.downcase}_class".to_sym
        object_class = object.is_a?(Class) ? object : object.class
        lookup(object, method) || lookup(object_class, method) || "#{object_class.name}#{subtype}".safe_constantize
      end

      private

      def to_material_class(object, lookup_name)
        object.public_send(lookup_name) if object.respond_to?(lookup_name)
      end
    end
  end
end
