class Ingredient < ApplicationRecord
  belongs_to :product

  validates :weight_needed_per_batch, presence: true, numericality: { greater_than: 0 }
  validates :unit_of_measure, presence: true
end
