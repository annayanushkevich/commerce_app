class ProductsController < ApplicationController

  #   def tabby_kitten
  #  @tabby_kitten = Product.all[0].name
  #  @tabby_kitten = Product.all[0].price
  # end

  def index
    @products = Product.all
  end

  def new
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def create
    new_product = Product.new(name:params[:name], price:params[:price],description:params[:description], image:params[:image])
    new_product.save
    flash[:success] = "new kitten has been added >^_^<"
    redirect_to "/products/#{new_product.id}"
  end

  def edit
    @product = Product.find_by(id:params[:id])

  end

  def update
    @product = Product.find_by(id:params[:id])
    @product.name =params[:name]
    @product.price =params[:price]
    @product.description =params[:description]
    @product.image =params[:image]
    @product.save
    flash[:success] = "kitten information updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id:params[:id])
    @product.destroy
    flash[:danger] = "your kitten has been destroyed"
    redirect_to "/products"
  end

end
