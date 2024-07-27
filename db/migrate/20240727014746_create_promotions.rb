class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :name
      t.text :description
      t.string :discount_type
      t.decimal :discount_value
      t.datetime :start_date
      t.datetime :end_date
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
