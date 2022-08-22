class Rental < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
end
