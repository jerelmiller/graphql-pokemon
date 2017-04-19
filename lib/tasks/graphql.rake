namespace :graphql do
  task schema_dump: :environment do
    schema =
      GraphqlPokemonSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY)

    File.open(Rails.root.join('schema.graphql'), 'w') do |f|
      f.write(JSON.dump(schema))
    end
  end
end
