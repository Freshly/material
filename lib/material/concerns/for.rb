# frozen_string_literal: true

# Build materials from objects based either an explicit definition or an optimistic lookup
module Material
  module For
    extend ActiveSupport::Concern

    LOOKUP_NAME = :material_class

    class_methods do
      def material_class_for(object, subtype)
        object.try(LOOKUP_NAME) || object.class.try(LOOKUP_NAME) || "#{object.class.name}#{subtype}".safe_constantize
      end
    end
  end
end
