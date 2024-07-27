class AddDemographicsToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :age, :integer
    add_column :customers, :gender, :string
    add_column :customers, :customer_segment, :string
  end
end
