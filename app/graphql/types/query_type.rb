Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

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
