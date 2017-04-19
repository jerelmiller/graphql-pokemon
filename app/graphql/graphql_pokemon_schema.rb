GraphqlPokemonSchema = GraphQL::Schema.define do
  query(Types::QueryType)

  id_from_object ->(object, type_definition, query_ctx) {
    object.to_global_id.to_param
  }

  object_from_id ->(id, query_ctx) {
    GlobalID::Locator.locate(id)
  }

  resolve_type ->(obj, ctx) {
    case obj
    when Pokemon then Types::PokemonType
    else raise("Unexpected object: #{obj}")
    end
  }
end
