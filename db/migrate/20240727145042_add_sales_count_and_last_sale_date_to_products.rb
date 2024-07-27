class AddSalesCountAndLastSaleDateToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :sales_count, :integer
    add_column :products, :last_sale_date, :datetime
  end
end
