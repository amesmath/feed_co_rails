class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :company, null: false, foreign_key: true
      t.decimal :total_amount
      t.datetime :sale_date
      t.string :status

      t.timestamps
    end
  end
end
