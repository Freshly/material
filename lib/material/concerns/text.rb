# frozen_string_literal: true

module Material
  module Text
    extend ActiveSupport::Concern

    DEFAULT_TRUNCATE_LENGTH = 50

    class_methods do
      private

      def register_title_truncator(key)
        register_truncator(key) { title }
      end

      def register_index_title_truncator(key)
        register_truncator(key) { title.pluralize }
      end

      def register_truncator(key, max_length = DEFAULT_TRUNCATE_LENGTH, &block)
        register_component(key, max_length: max_length, &block)
        define_truncation_formatter(key)
        define_truncation_predicate(key)
      end

      def define_truncation_formatter(key)
        define_method(key) do
          public_send("#{key}_value".to_sym).truncate(public_send("#{key}_component".to_sym).options[:max_length])
        end
        memoize key
      end

      def define_truncation_predicate(key)
        method_name = "#{key}_truncated?".to_sym
        define_method(method_name) do
          public_send("#{key}_value".to_sym).length > public_send("#{key}_component".to_sym).options[:max_length]
        end
        memoize method_name
      end
    end

    included do
      register_truncator(:title) { default_title.titleize }

      register_component(:parameterized_title) { title_value.underscore.parameterize }

      register_title_truncator :list_title
      register_title_truncator :header_title
      register_title_truncator :reference_title
      register_title_truncator :breadcrumb_title

      register_index_title_truncator :index_title
      register_index_title_truncator :breadcrumb_index_title

      private

      def default_title
        source.try(:title) || source.try(:name) || try(:model_name)&.human || source.class.name
      end
    end
  end
end
