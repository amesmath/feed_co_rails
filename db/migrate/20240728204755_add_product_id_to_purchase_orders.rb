class AddProductIdToPurchaseOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :purchase_orders, :product_id, :integer
  end
end
