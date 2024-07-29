class Ingredient < ApplicationRecord
  belongs_to :product
  belongs_to :supplier_product, class_name: 'Product'

  validates :weight_needed_per_batch, presence: true, numericality: { greater_than: 0 }
  validates :unit_of_measure, presence: true
end
