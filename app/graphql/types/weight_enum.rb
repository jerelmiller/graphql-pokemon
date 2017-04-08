Types::WeightEnum = GraphQL::EnumType.define do
  name 'Weight'
  description 'Units of weight'

  value Weight::Unit::KILOGRAM, 'weight in kilograms'
  value Weight::Unit::POUND, 'weight in pounds'
end
