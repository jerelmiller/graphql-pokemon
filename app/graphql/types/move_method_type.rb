Types::MoveMethodType = GraphQL::ObjectType.define do
  name 'MoveMethod'

  field :name, !types.String, 'Name of move method'
  field :description, !types.String, 'Description of move method'
end
