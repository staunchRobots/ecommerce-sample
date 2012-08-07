class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    respond_to do |format|      
      if @line_item.save
        format.html { redirect_to @line_item.cart, 
          notice: "You have added an item to your Cart" }
      else
        flash[:error] = "Your product could not be added"
        format.html { redirect_to home_url  }
      end
    end

  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to @line_item.cart }
      format.js { @line_item }
    end

  end

end
