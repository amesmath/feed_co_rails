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
    # Get all PurchaseOrders where company_id is one of the internal_company_ids
    purchase_orders = PurchaseOrder.where(company_id: internal_company_ids).limit(30)

    # Initialize a hash to store the purchase order count by product and month
    purchase_order_data = Hash.new { |hash, key| hash[key] = Array.new(6, 0) }

    # Define the last six months
    last_six_months = (0..5).map { |i| (Date.today - i.months).strftime('%B') }.reverse

    purchase_orders.each do |po|
      month = po.order_date.strftime('%B')
      index = last_six_months.index(month)
      next if index.nil? # Skip if the month is not in the last six months

      po.products.each do |product|
        product_name = product.name
        purchase_order_data[product_name][index] += 1
      end
    end

    # Return data formatted for HighCharts
    {
      categories: last_six_months,
      series: purchase_order_data.map { |product_name, data| { name: product_name, data: data } }
    }
  end
end
