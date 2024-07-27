class CreateMerchandisings < ActiveRecord::Migration[7.0]
  def change
    create_table :merchandisings do |t|
      t.references :product, null: false, foreign_key: true
      t.string :activity_type
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :discount_percentage

      t.timestamps
    end
  end
end
