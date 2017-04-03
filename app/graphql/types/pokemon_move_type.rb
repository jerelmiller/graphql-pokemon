Types::PokemonMoveType = GraphQL::ObjectType.define do
  name 'PokemonMove'

  field :level, !types.Int

  field :move, !Types::MoveType
  field :moveMethod, !Types::MoveMethodType, property: :move_method
end
