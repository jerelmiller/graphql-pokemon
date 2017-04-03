class Move < ApplicationRecord
  belongs_to :effect
  belongs_to :type

  validates :effect, :type, :name, :pp, presence: true

  def effect_description
    effect
      .description
      .sub('$effect_chance', effect_chance.to_s)
      .sub(/\[(.*?)\]\{.*?\}/, '\1')
  end
end
