class Review < ApplicationRecord
  belongs_to :rental

  validates :item_score, presence: true, numericality: { only_integer: true }
  validates :item_comment, presence: true, length: { minimum: 6 }
end
