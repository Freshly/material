# frozen_string_literal: true

# Format output content consistently.
module Material
  module Format
    extend ActiveSupport::Concern

    included do
      delegate :format_date, :format_time, :format_datetime, to: :class
    end

    class_methods do
      def format_date(date)
        date.to_s(:long)
      end

      def format_datetime(datetime)
        datetime.to_s(:long)
      end
      alias_method :format_time, :format_datetime
    end
  end
end
