# frozen_string_literal: true

module Rspec
  module Generators
    class ListGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def create_spec_file
        template "list_spec.rb.erb", File.join("spec/lists/", class_path, "#{file_name}_list_spec.rb")
      end
    end
  end
end
