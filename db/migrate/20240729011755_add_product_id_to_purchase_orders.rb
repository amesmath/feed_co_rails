class AddProductIdToPurchaseOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchase_orders, :product, foreign_key: true
  end
end
