class Pokemon < ApplicationRecord
  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  has_many :pokemon_weaknesses
  has_many :weaknesses, through: :pokemon_weaknesses, source: :type

  has_many :pokemon_strengths
  has_many :strengths, through: :pokemon_strengths, source: :type

  has_many :pokemon_moves, -> { includes(:move) }

  validates :name,
    :number,
    :attack,
    :defense,
    :hp,
    :special_attack,
    :special_defense,
    :speed,
    presence: true
end
