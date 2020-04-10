# frozen_string_literal: true

module Material
  module Generators
    class ListGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      hook_for :test_framework

      def create_application_state
        template "list.rb.erb", File.join("app/lists/", class_path, "#{file_name}_list.rb")
      end
    end
  end
end
