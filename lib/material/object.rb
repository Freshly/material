# frozen_string_literal: true

module Material
  class Object < Spicerack::AttributeObject
    attr_reader :source

    delegate :name, to: :class, prefix: true

    delegate_missing_to :source

    class << self
      private

      def references(field, as:, from: :source)
        delegate field, to: from
        alias_method as, field
      end
    end

    def initialize(object)
      raise ArgumentError, "source is required" if object.nil?

      @source = object
    end
  end
end
