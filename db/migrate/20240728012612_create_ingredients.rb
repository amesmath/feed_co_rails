class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.decimal :weight_needed_per_batch, precision: 10, scale: 2, null: false
      t.string :unit_of_measure, null: false
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
