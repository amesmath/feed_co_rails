class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.ingredients.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :sku, :price, :cost, :stock_quantity, :product_type, :company_id,
                                    ingredients_attributes: %i[id weight_needed_per_batch unit_of_measure supplier_product_id _destroy])
  end
end
