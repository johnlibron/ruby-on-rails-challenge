class Product < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  
  scope :expensive, -> { where('price > 100') }
  scope :by_user, ->(user_id) { where(user_id: user_id) }
end