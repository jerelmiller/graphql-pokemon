Types::LengthUnitEnum = GraphQL::EnumType.define do
  name 'LengthUnit'
  description 'Units of length'

  value Length::Unit::METER, 'length in meters'
  value Length::Unit::FOOT, 'length in feet'
end
