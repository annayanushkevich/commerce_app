class OrdersController < ApplicationController

  def create
  product = Product.find_by(id: params[:product_id])
  quantity = params[:quantity]

   subtotal = product.price * quantity.to_i
   sales_tax = product.sales_tax * quantity.to_i
   puts sales_tax
   total = subtotal + sales_tax

    #@quantity = params[:quantity]
    new_order = Order.new(user_id: current_user.id, subtotal: subtotal, tax: sales_tax, total: total, completed: false)
    new_order.save
    
    flash[:success]= "sold"
    redirect_to "/orders/#{new_order.id}"
  end

  def show
    @new_order = Order.find_by(id: params[:id])
  end

end
