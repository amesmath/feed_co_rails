class AddSupplierProductToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :supplier_product, foreign_key: { to_table: :products }
  end
end
