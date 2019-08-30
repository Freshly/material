# frozen_string_literal: true

# Build materials from objects based either an explicit definition or an optimistic lookup
module Material
  module For
    extend ActiveSupport::Concern

    class_methods do
      def material_class_for(object, subtype)
        lookup_name = "#{subtype.downcase}_class".to_sym
        return object.public_send(lookup_name) if object.respond_to?(lookup_name)

        object_class = object.is_a?(Class) ? object : object.class
        return object_class.public_send(lookup_name) if object_class.respond_to?(lookup_name)

        "#{object_class.name}#{subtype}".safe_constantize
      end
    end
  end
end
