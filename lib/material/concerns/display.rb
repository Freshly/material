# frozen_string_literal: true

module Material
  module Display
    extend ActiveSupport::Concern

    included do
      register_component :icon
      register_component :icon_title

      register_component :badge
      register_component :badge_style

      register_component :label
      register_component :label_style
    end
  end
end
