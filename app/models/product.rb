class Product < ApplicationRecord
  validates :sku, presence: true, uniqueness: true
  belongs_to :company
  has_many :ingredients, dependent: :destroy
  has_many :purchase_orders, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
