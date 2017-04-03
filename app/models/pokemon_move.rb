class PokemonMove < ApplicationRecord
  belongs_to :pokemon
  belongs_to :move

  validates :pokemon, :move, :level, presence: true
end
