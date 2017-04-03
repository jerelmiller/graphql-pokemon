Types::PokemonType = GraphQL::ObjectType.define do
  name 'Pokemon'

  field :id, !types.ID
  field :name, !types.String
  field :number, !types.String
  field :attack, !types.Int
  field :defense, !types.Int
  field :hp, !types.Int
  field :specialAttack, !types.Int, property: :special_attack
  field :specialDefense, !types.Int, property: :special_defense
  field :speed, !types.Int

  field :types, !types[!types.String] do
    description 'Pokemon types'
    resolve ->(pokemon, args, ctx) { pokemon.types.pluck(:name) }
  end

  field :weaknesses, !types[!types.String] do
    description 'Pokemon weaknesses'
    resolve ->(pokemon, args, ctx) { pokemon.weaknesses.pluck(:name) }
  end

  field :strengths, !types[!types.String] do
    description 'Pokemon strengths'
    resolve ->(pokemon, args, ctx) { pokemon.strengths.pluck(:name) }
  end
end
