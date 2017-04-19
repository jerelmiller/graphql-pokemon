Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :node, GraphQL::Relay::Node.field
  field :nodes, GraphQL::Relay::Node.plural_field

  field :pokemons, types[Types::PokemonType] do
    description 'Get all pokemon'
    resolve Resolvers::PokemonResolver.new
  end

  field :pokemon, Types::PokemonType do
    argument :id, !types.ID
    description 'Get a pokemon by id'
    resolve ->(_, args, ctx) { Pokemon.find(args[:id]) }
  end
end
