class SearchController < ApplicationController
  layout 'products'

  def query
    @products = Product.text_search(params[:q])
  end

end
