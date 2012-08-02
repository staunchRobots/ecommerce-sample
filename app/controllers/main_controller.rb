class MainController < ApplicationController
  def index
    #this will be a 'featured' scope eventually
    @products = Product.limit(9).order("created_at DESC") 
  end
end
