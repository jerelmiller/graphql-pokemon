Types::MoveType = GraphQL::ObjectType.define do
  name 'Move'

  field :name, !types.String, 'Name of the move' do
    resolve ->(move, args, ctx) { move.name.titleize }
  end

  field :pp, !types.Int, 'Power points used by move'
  field :power, types.Int, 'Power of move'
  field :accuracy, types.Int, 'Accuracy of move'
  field :effect,
    !types.String,
    'Effect move has on opponent',
    property: :effect_description
end
