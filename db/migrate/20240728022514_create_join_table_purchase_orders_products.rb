class CreateJoinTablePurchaseOrdersProducts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :purchase_orders, :products do |t|
      t.index :purchase_order_id
      t.index :product_id
    end
  end
end
