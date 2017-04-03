class Move < ApplicationRecord
  belongs_to :effect
  belongs_to :type

  validates :move, :type, :name, :pp, presence: true
end
