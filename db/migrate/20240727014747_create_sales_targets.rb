class CreateSalesTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_targets do |t|
      t.references :product, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.string :target_period
      t.decimal :target_amount
      t.decimal :achieved_amount
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
