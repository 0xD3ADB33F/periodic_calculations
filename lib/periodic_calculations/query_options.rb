module PeriodicCalculations
  class QueryOptions
    OPERATION = [:count, :max, :min, :sum, :avg]
    INTERVAL_UNIT = [:day, :week, :month, :year]

    attr_reader :operation,
                :column_name,
                :window_start,
                :window_end,
                :interval_unit,
                :cumulative,
                :timezone_offset

    def initialize(operation, column_name, window_start, window_end, options = {})
      @operation = operation
      @column_name = column_name
      @window_start = window_start
      @window_end = window_end
      @interval_unit = options[:interval_unit] || :day
      @cumulative = !!options[:cumulative]
      @timezone_offset = Time.now.in_time_zone.utc_offset

      validate!
    end

    private

    def validate!
      validate_operation!
      validate_column_name!
      validate_window!
      validate_interval_unit!
    end

    def validate_operation!
      unless OPERATION.include?(@operation)
        raise ArgumentError.new("Invalid operation")
      end
    end

    def validate_column_name!
      unless @column_name.present?
        raise ArgumentError.new("Column name must be present")
      end
    end

    def validate_window!
      unless window_start.is_a?(DateTime) && window_end.is_a?(DateTime)
        raise ArgumentError.new("Invalid DateTime window")
      end
    end

    def validate_interval_unit!
      unless INTERVAL_UNIT.include?(@interval_unit)
        raise ArgumentError.new("Invalid interval unit")
      end
    end
  end
end