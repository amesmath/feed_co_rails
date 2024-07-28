# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  def index
    @purchase_order_data = purchase_order_data_for_chart
  end

  private

  def purchase_order_data_for_chart
    # Get all Companies where is_internal: true
    internal_company_ids = Company.where(is_internal: true).pluck(:id)

    # Get all PurchaseOrders where company_id is one of the internal_company_ids
    purchase_orders = PurchaseOrder.where(company_id: internal_company_ids)

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
