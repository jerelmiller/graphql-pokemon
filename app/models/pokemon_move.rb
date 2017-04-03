class PokemonMove < ApplicationRecord
  belongs_to :pokemon
  belongs_to :move
  belongs_to :move_method

  validates :pokemon, :move, :move_method, :level, presence: true
end
