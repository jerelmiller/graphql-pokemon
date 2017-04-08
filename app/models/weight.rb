class Weight
  class Unit
    KILOGRAMS = 'kg'.freeze
    POUNDS = 'lb'.freeze
  end

  POUNDS_PER_KILOGRAM = 2.20462

  def initialize(weight_in_kg)
    @weight = weight_in_kg
  end

  def convert(unit:)
    case unit.downcase
    when Unit::KILOGRAMS then @weight.round(2)
    when Unit::POUNDS then (@weight * POUNDS_PER_KILOGRAM).round(2)
    else raise ArgumentError, "cannot convert to unit #{unit}"
    end
  end
end
