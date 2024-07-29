class ApplicationController < ActionController::Base
  before_action :bypass_login_for_demo

  private

  def bypass_login_for_demo
    return unless Rails.env.production? && ENV['DEMO_MODE'] == 'true'
    
    # Example user bypass
    user = User.find_by(email: 'demo@example.com')
    sign_in(user) if user
  end
end
