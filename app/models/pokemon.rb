class Pokemon < ApplicationRecord
  has_many :pokemon_types, -> { ordered }
  has_many :types, through: :pokemon_types

  has_many :pokemon_weaknesses
  has_many :weaknesses, through: :pokemon_weaknesses, source: :type

  has_many :pokemon_strengths
  has_many :strengths, through: :pokemon_strengths, source: :type

  has_many :pokemon_moves, -> { includes(:move) }

  has_closure_tree parent_column_name: :involution_id,
    hierarchy_class_name: 'EvolutionHierarchy',
    hierarchy_table_name: 'evolution_hierarchies',
    name_column: :number

  validates :name,
    :number,
    :attack,
    :defense,
    :hp,
    :special_attack,
    :special_defense,
    :speed,
    presence: true

  def evolutions
    root.self_and_descendants
  end

  def weight
    Weight.new(self[:weight])
  end
end
