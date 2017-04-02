module Types
  PokemonType = GraphQL::ObjectType.define do
    name 'Pokemon'
    description 'A pokemon'

    field :id, !types.ID
    field :name, !types.String
    field :number, !types.String
    field :description, types.String
  end
end
