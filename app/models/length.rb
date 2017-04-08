class Length
  class Unit
    FOOT = 'FOOT'.freeze
    METER = 'METER'.freeze
  end

  FEET_PER_METER = 3.28084

  def initialize(length_in_meters)
    @length = length_in_meters
  end

  def convert(unit:)
    case unit
    when Unit::METER then @length.round(2)
    when Unit::FOOT then (@length * FEET_PER_METER).round(2)
    else raise ArgumentError, "cannot convert to unit #{unit}"
    end
  end
end
