class Weight
  class Unit
    KILOGRAM = 'KILOGRAM'.freeze
    POUND = 'POUND'.freeze
  end

  POUNDS_PER_KILOGRAM = 2.20462

  def initialize(weight_in_kg)
    @weight = weight_in_kg
  end

  def convert(unit:)
    case unit
    when Unit::KILOGRAM then @weight.round(2)
    when Unit::POUND then (@weight * POUNDS_PER_KILOGRAM).round(2)
    else raise ArgumentError, "cannot convert to unit #{unit}"
    end
  end
end
