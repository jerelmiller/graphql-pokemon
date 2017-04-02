class Pokemon < ApplicationRecord
  validates :name, :number, presence: true

  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  has_many :pokemon_weaknesses
  has_many :weaknesses, through: :pokemon_weaknesses

  has_many :pokemon_strengths
  has_many :strengths, through: :pokemon_strengths
end
