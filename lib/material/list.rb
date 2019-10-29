# frozen_string_literal: true

module Material
  class List < Collectible::CollectionBase
    include Material::Components
    include Material::Display
    include Material::Text
    include Material::Site
    include Material::Pagination
    include Material::Mount
    include Material::Collection
    include Material::Format

    class << self
      delegate :for, :class_for, to: :class_finder

      private

      def class_finder
        @_class_finder ||= Spicerack::ClassFinder.new("List")
      end
    end

    def contextualize(parent)
      @context_parent = parent
    end

    def default_parent
      @context_parent
    end

    def default_title
      (item_class.try(:model_name)&.human || item_class&.name).pluralize || self.class.name
    end
  end
end
