class MainController < ApplicationController
  def index
    @products = Product.featured.limit(6)
  end
end
