class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :sku
      t.string :category
      t.references :company, null: false, foreign_key: true
      t.decimal :price
      t.decimal :cost
      t.integer :stock_quantity

      t.timestamps
    end

    add_index :products, :company_id unless index_exists?(:products, :company_id)

    return if index_exists?(:products, :sku, unique: true)

    add_index :products, :sku, unique: true
  end
end
