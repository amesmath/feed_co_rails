class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_sales = Sale.sum(:total_amount)
    @total_customers = Customer.count
    @products = Product.includes(:category).limit(5)
    @recent_sales = Sale.order(sale_date: :desc).limit(5)

    gpt_service = GptService.new(ENV.fetch('GPT_API_KEY', nil))
    response = gpt_service.get_analysis('Analyze the sales data trends.')

    @gpt_analysis = if response && response['choices']
                      response['choices'][0]['text']
                    else
                      'GPT analysis could not be retrieved.'
                    end
  end
end
