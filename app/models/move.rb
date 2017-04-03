class Move < ApplicationRecord
  belongs_to :effect
  belongs_to :type

  validates :effect, :type, :name, :pp, presence: true
end
