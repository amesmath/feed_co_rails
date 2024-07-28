# db/migrate/TIMESTAMP_create_purchase_orders.rb
class CreatePurchaseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_orders do |t|
      t.references :company, null: false, foreign_key: true
      t.string :order_number, null: false
      t.date :order_date, null: false
      t.date :delivery_date
      t.decimal :total_amount, precision: 10, scale: 2, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
