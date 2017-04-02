class PokemonStrength < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type
end
