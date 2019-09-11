# frozen_string_literal: true

# Format output content consistently.
module Material
  module Format
    extend ActiveSupport::Concern

    included do
      delegate :format_date, :format_time, :format_number, :format_by_type, to: :class
    end

    class_methods do
      def format_date(date)
        date.to_date.to_s(:long)
      end

      def format_time(time)
        time.to_s(:long)
      end

      def format_number(number)
        number_to_delimited(number)
      end

      def format_by_type(value, type:)
        case type.to_sym
        when :date
          format_date(value)
        when :datetime, :timestamp
          format_time(value)
        when :decimal, :float, :integer
          format_number(value)
        else
          value
        end
      end
    end
  end
end
