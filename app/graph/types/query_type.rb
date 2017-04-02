module Types
  QueryType = GraphQL::ObjectType.define do
    name 'Query'
    description 'The root query object'

    field :pokemons, Types::PokemonType do
      description 'Get all pokemon'

      resolve ->(_, _, _) { Pokemon.all }
    end
  end
end
