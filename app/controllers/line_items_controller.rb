class LineItemsController < ApplicationController

  def create
    cart = current_user.current_cart
    product = Product.find(params[:product_id])
    @line_item = cart.add_product(product.id)
     
    if @line_item.save
      LineItem.deliver_notification(current_user.first_name, current_user.email, 
        @line_item.product.name)
      respond_to do |format| 
        format.html { redirect_to @line_item.cart, 
          notice: "You have added an item to your Cart" }
      end
    else
      flash[:error] = "Your product could not be added"
      respond_with(@line_item.cart)
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
