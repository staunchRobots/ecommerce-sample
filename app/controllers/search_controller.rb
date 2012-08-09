class SearchController < ApplicationController
  layout 'products'

  def query
    @products = Product.text_search(params[:q]) #.paginate() here
  end

end
