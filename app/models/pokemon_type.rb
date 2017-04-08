class PokemonType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type

  scope :ordered, ->{ order(order: :asc) }
end
