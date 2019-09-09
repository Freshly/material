# frozen_string_literal: true

module Material
  module Mount
    extend ActiveSupport::Concern

    def mount_facet(facet)
      output = facet.output
      @current_page = output.current_page
      @total_pages = output.total_pages
      concat(output)
    end
  end
end
