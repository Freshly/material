# frozen_string_literal: true

module Material
  module Page
    extend ActiveSupport::Concern

    included do
      register_component :parent
      register_component :filter
      register_component :filter_default
    end
  end
end
