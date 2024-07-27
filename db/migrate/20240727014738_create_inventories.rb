class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity_on_hand
      t.integer :reorder_level
      t.integer :reorder_quantity
      t.string :location

      t.timestamps
    end
  end
end
