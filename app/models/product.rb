class Product < ApplicationRecord
  belongs_to :company
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
