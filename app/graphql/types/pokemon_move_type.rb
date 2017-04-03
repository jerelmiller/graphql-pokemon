Types::PokemonMoveType = GraphQL::ObjectType.define do
  name 'PokemonMove'

  field :level, !types.Int

  field :move, !Types::MoveType do
    resolve ->(pokemon_move, args, ctx) { pokemon_move.move }
  end
end
