class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :sku
      t.references :category, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.decimal :price
      t.decimal :cost
      t.integer :stock_quantity

      t.timestamps
    end

    add_index :products, :sku, unique: true
  end
end
