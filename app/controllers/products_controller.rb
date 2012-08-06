class ProductsController < ApplicationController

  layout 'products'

  def index
    @products = Product.limit(9).order("created_at DESC")
  end

  def show
    @product = Product.find(params[:id])
  end
end
