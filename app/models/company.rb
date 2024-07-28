class Company < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :purchase_orders
end
