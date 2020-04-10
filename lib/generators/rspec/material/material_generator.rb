# frozen_string_literal: true

module Rspec
  module Generators
    class MaterialGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def create_spec_file
        template "material_spec.rb.erb", File.join("spec/materials/", class_path, "#{file_name}_material_spec.rb")
      end
    end
  end
end
