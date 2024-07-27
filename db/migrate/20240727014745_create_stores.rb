class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.references :region, null: false, foreign_key: true
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
