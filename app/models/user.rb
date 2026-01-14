class User < ApplicationRecord
  has_many :products, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true, numericality: { greater_than: 0 }
  
  scope :adults, -> { where('age >= 18') }
  scope :by_city, ->(city) { where(city: city) }
end