# frozen_string_literal: true

module Material
  module Filter
    extend ActiveSupport::Concern

    included do
      register_component :filter_field
      register_component(:filter_values) { try("#{filter_field.to_s.pluralize}_i18n") || [] }
    end
  end
end
