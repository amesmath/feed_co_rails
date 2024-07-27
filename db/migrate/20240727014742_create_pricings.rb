class CreatePricings < ActiveRecord::Migration[7.0]
  def change
    create_table :pricings do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
