class CartedProductsController < ApplicationController
  def create
    if Order.find_by(completed: false)
      order = Order.find_by(completed: false)
    else
      order = Order.new(completed: false, user_id: current_user.id)
      order.save
    end

    carted_product = CartedProduct.new(product_id: params[:product_id], order_id: order.id, quantity: params[:quantity])
    carted_product.save
    session[:cart_count] = nil
    redirect_to "/carted_products"
  end

  def show
  # @carted_products = Carted_product.find_by(id: params[:id])
  end

  def index
   order = current_user.orders.find_by(completed: false)
   @carted_products = order.carted_products
  end

  def update
    order = Order.find_by(id: params[:id])
    total_tax = 0
    total_subtotal = 0

    order.carted_products.each do |carted_product|
      total_tax += (carted_product.product.tax * carted_product.quantity)
      total_subtotal += (carted_product.product.price * carted_product.quantity)

    total = total_tax + total_subtotal


    order.update(completed: true, tax: total_tax, subtotal: total_subtotal, total: total )
    session[:cart_count] = nil
    redirect_to "/orders/#{order.id}"
  end

  def destroy
    CartedProduct.find_by(id: params[:id]).destroy
    session[:cart_count] = nil
    redirect_to "/carted_products"
  end
end


end
  # if order.complete == false
  #   order.new



