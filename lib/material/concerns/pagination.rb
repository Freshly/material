# frozen_string_literal: true

module Material
  module Pagination
    extend ActiveSupport::Concern

    included do
      attr_reader :current_page, :total_pages
    end

    def initialize(*arguments, current_page: 1, total_pages: 1)
      super(*arguments)
      @current_page = current_page
      @total_pages = total_pages
    end
  end
end
