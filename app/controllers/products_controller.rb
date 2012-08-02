class ProductsController < ApplicationController

  def index
    @products = Product.limit(9).order("created_at DESC")
  end

  def show
  end
end
