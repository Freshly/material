# frozen_string_literal: true

module Material
  module Site
    extend ActiveSupport::Concern

    included do
      register_component :parent
      register_component :filter
      register_component :filter_default
      register_path_component(:path, :singular_route_key)
      register_path_component(:index_path, :route_key)
    end

    class_methods do
      def register_path_component(key, route_key_method)
        register_component(route_key_method) { try(:model_name)&.public_send(route_key_method) }
        register_component(key) do
          route_key = public_send(route_key_method)
          "#{route_key}_path".to_sym if route_key.present?
        end

        define_method("#{key}?") do
          return false unless defined?(Rails)

          Rails.application.routes.url_helpers.respond_to?(public_send("#{key}_value".to_sym))
        end
      end
    end
  end
end
