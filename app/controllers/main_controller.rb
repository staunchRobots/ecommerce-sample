class MainController < ApplicationController
  def index
    # use scope: Product.homepage or something else
    @products = Product.featured.limit(6)
  end
end
