class AddIsSupplierAndIsCustomerToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :isSupplier, :boolean
    add_column :customers, :isCustomer, :boolean
    rename_table :customers, :companies
  end
end
