class Admin::ProductsController < ApplicationController
  layout 'admin'
  load_and_authorize_resource

  def index
    @products = Product.limit(6).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to products_path, notice: "Product created!"
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      redirect_to products_path, notice: "Product destroyed successfully."
    end
  end

end
