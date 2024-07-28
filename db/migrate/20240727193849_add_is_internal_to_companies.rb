class AddIsInternalToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :is_internal, :boolean
  end
end
