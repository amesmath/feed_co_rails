class Product < ApplicationRecord
  belongs_to :category
  belongs_to :company
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
