class CatalogController < ApplicationController
  layout "products"

  def show
  end

  def per_category
    @title = params[:name]
    @products = Category.find(params[:id]).products.available.paginate(page: params[:page])
      .order("created_at DESC")
  end

end
