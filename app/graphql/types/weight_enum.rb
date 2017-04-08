Types::WeightEnum = GraphQL::EnumType.define do
  name 'Weight'
  description 'Units of weight'

  value Weight::Unit::KILOGRAMS.upcase, 'weight in kilograms'
  value Weight::Unit::POUNDS.upcase, 'weight in pounds'
end
