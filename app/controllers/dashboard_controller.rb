# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  def index
    @purchase_order_data = purchase_order_data_for_chart
  end

  private

  def purchase_order_data_for_chart
    products = Product.all
    purchase_order_data = {}
    current_month = Date.today.beginning_of_month

    # Get purchase order counts grouped by product and month in one query
    purchase_orders = PurchaseOrder
                      .where(order_date: 6.months.ago.beginning_of_month..current_month)
                      .group("product_id, DATE_TRUNC('month', order_date)")
                      .count

    products.each do |product|
      po_counts = (0..5).map do |i|
        month = i.months.ago.beginning_of_month
        purchase_orders[[product.id, month]] || 0
      end

      purchase_order_data[product.name] = po_counts.reverse
    end

    purchase_order_data
  end
end
