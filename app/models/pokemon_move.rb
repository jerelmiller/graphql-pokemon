class PokemonMove < ApplicationRecord
  belongs_to :pokemon
  belongs_to :move

  validates :level, presence: true
end
