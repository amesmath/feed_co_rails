class CreateSalesDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_details do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :total_price

      t.timestamps
    end
  end
end
