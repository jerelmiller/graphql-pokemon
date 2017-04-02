module Types
  PokemonType = GraphQL::ObjectType.define do
    name 'Pokemon'
    description 'A pokemon'

    field :id, !types.ID
    field :name, !types.string
    field :number, !types.string
    field :description, types.string
  end
end
