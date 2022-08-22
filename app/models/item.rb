class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many :reviews, through: :rentals

  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 6 }
  validates :category, presence: true
  validates :category, inclusion: { in: ["Vehicles", "Tools", "Clothing", "Weddings", "Electronics", "Jewellery", "Bags", "Books", "Rooms", "Sports", "Boats", "Aeroplains"] }
  validates :price_per_day, presence: true, numericality: true
end
