# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  def index
    @purchase_order_data = purchase_order_data_for_chart
    @companies = with_more_than_ten_products
    @low_stock_products = Product.where(company_id: internal_company_ids)
                                 .order(:stock_quantity)
                                 .limit(5)
    @products_with_ingredients = Product.where(company_id: internal_company_ids)
                                        .includes(ingredients: { supplier_product: :company })

    @top_products = Product.where(company_id: internal_company_ids)
                           .order(sales_count: :desc)
                           .limit(12)

    respond_to do |format|
      format.html
      format.json do
        render json: @products_with_ingredients.as_json(include: { ingredients: { include: { supplier_product: { include: :company } } } })
      end
    end
  end

  def search
    query = params[:query]
    @products_with_ingredients = Product.where('name ILIKE ?', "%#{query}%")
                                        .where(company_id: internal_company_ids)
                                        .includes(ingredients: { supplier_product: :company })

    render json: @products_with_ingredients.as_json(
      include: { ingredients: { include: { supplier_product: { include: :company } } } }
    )
  end

  private

  def internal_company_ids
    Company.where(is_internal: true).pluck(:id)
  end

  def with_more_than_ten_products
    @companies = Company.joins(:products)
                        .group('companies.id')
                        .having('COUNT(products.id) > 16')
                        .select('companies.*, COUNT(products.id) as product_count')
  end

  def purchase_order_data_for_chart
    @purchase_orders = PurchaseOrder.where(company_id: internal_company_ids).limit(120)

    # Format data for Highcharts
    @chart_data = @purchase_orders.map do |po|
      {
        name: po.created_at.strftime('%Y-%m-%d'), # Assuming purchase order has a created_at attribute
        data: po.total_amount # Assuming purchase order has an amount attribute
      }
    end
  end
end
