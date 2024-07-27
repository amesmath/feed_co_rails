class AddOptionalColumnsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :min_lead_time, :integer
    add_column :products, :min_order_quantity, :integer
    add_column :products, :reorder_level, :integer
    add_column :products, :reorder_quantity, :integer
    add_column :products, :unit_of_measure, :string
    add_column :products, :expiration_date, :datetime
    add_column :products, :weight, :decimal
    add_column :products, :dimensions, :string
    add_column :products, :storage_conditions, :string
    add_column :products, :product_origin, :string
    add_column :products, :certifications, :string
    add_column :products, :hazardous_material, :boolean
    add_column :products, :comments, :text
  end
end
