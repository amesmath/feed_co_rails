class DashboardController < ApplicationController
  def index
    @sales_data = sales_data_for_chart
  end

  private

  def sales_data_for_chart
    products = Product.all.includes(:company)
    sales_data = {}

    products.each do |product|
      sales_counts = (0..5).map do |i|
        start_date = i.months.ago.beginning_of_month
        end_date = i.months.ago.end_of_month
        product.sales.where('created_at BETWEEN ? AND ?', start_date, end_date).count
      end

      sales_data[product.name] = sales_counts.reverse
    end

    sales_data
  end
end
