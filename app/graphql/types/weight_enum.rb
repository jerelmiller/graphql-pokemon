Types::WeightEnum = GraphQL::EnumType.define do
  name 'Weight'
  description 'Units of weight'

  value Weight::Unit::KILOGRAMS, 'weight in kilograms'
  value Weight::Unit::POUNDS, 'weight in pounds'
end
