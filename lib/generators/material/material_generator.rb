# frozen_string_literal: true

module Material
  module Generators
    class MaterialGenerator < Rails::Generators::NamedBase
      class_option :list, type: :boolean, default: true

      source_root File.expand_path("templates", __dir__)

      hook_for :list, as: "material:list"
      hook_for :test_framework

      def create_material
        template "material.rb.erb", File.join("app/materials/", class_path, "#{file_name}_material.rb")
      end
    end
  end
end
