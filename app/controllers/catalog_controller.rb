class CatalogController < ApplicationController
  layout "products"

  def show
  end

  def per_category
    @title = params[:name]
    # 1. Use scopes
    # 2. better to fetch category in separate instance variable(at least need category name in view)
    @products = Category.find(params[:id]).products.available.paginate(page: params[:page])
      .order("created_at DESC")
  end

end
