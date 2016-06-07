class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :calculate

  def calculate_cart_count
    if current_user && current_user.orders.find_by(completed:false)
      @cart_count = session[:cart_count]
    else
      @cart_count = current_user.orders.find_by(completed: false).carted_products.count
    end
  else
    @cart_count = 0
  end


  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end


end
