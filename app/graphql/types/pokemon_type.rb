Types::PokemonType = GraphQL::ObjectType.define do
  name 'Pokemon'

  implements GraphQL::Relay::Node.interface

  global_id_field :id

  field :id, !types.ID
  field :name, !types.String
  field :number, !types.String
  field :attack, !types.Int
  field :defense, !types.Int
  field :hp, !types.Int
  field :specialAttack, !types.Int, property: :special_attack
  field :specialDefense, !types.Int, property: :special_defense
  field :speed, !types.Int
  field :height, !types.Float do
    argument :unit, Types::LengthUnitEnum
    description "Height of pokemon. Default unit is #{Length::Unit::METER}"
    resolve ->(pokemon, args, ctx) {
      pokemon.height.convert(unit: args[:unit] || Length::Unit::METER)
    }
  end

  field :weight, !types.Float do
    argument :unit, Types::WeightUnitEnum
    description "Weight of pokemon. Default unit is #{Weight::Unit::KILOGRAM}"
    resolve ->(pokemon, args, ctx) {
      pokemon.weight.convert(unit: args[:unit] || Weight::Unit::KILOGRAM)
    }
  end

  field :description, !types.String

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

  field :moves, types[Types::PokemonMoveType] do
    description 'Moves performed by pokemon'
    resolve ->(pokemon, args, ctx) { pokemon.pokemon_moves }
  end

  field :evolutions, ->{ types[Types::PokemonType] } do
    description 'Evolutions of the pokemon'
  end

  field :image, !types.String do
    description 'Image for pokemon'
    resolve ->(pokemon, args, ctx) {
      ActionController::Base.helpers.image_url(
        "#{pokemon.number}#{pokemon.name.gsub(/[^a-zA-Z\-]/, '')}.png",
        host: ctx[:request].base_url
      )
    }
  end
end
