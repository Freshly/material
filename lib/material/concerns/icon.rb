# frozen_string_literal: true

module Material
  module Icon
    extend ActiveSupport::Concern

    included do
      register_component :icon
      register_component :icon_title
    end
  end
end
