Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :testField2, types.String do
    resolve ->(obj, args, ctx) { 'Hello again!' }
  end
end
