class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  before_action :auto_login_dev_user

  private

  def auto_login_dev_user
    sign_in(User.first) unless user_signed_in?
  end
end
