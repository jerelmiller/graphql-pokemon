class MoveMethod < ApplicationRecord
  validates :name, :description, presence: true
end
