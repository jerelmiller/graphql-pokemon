Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :pokemons, types[Types::PokemonType] do
    description 'Get all pokemon'
    resolve Resolvers::PokemonResolver.new
  end
end
