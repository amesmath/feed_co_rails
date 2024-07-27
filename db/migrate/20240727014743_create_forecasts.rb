class CreateForecasts < ActiveRecord::Migration[7.0]
  def change
    create_table :forecasts do |t|
      t.string :forecast_type
      t.references :product, null: false, foreign_key: true
      t.string :forecast_period
      t.date :forecast_date
      t.decimal :forecast_value

      t.timestamps
    end
  end
end
