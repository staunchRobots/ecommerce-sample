class ProductsController < ApplicationController
  before_filter :authenticate_user!
  layout 'products'

  def index
    # Use scopes
    @products = Product.available.paginate(page: params[:page]).order("created_at DESC")
  end

  def show
    @product = Product.find(params[:id])
  end
end
