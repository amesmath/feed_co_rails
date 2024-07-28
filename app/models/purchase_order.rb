class PurchaseOrder < ApplicationRecord
  belongs_to :company

  has_and_belongs_to_many :products

  validates :order_number, presence: true, uniqueness: true
  validates :order_date, presence: true
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true
end
