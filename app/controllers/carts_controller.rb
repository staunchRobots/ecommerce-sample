class CartsController < ApplicationController
  
  layout 'products'

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue
      redirect_to home_url, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html
        format.json { render json: @cart }
      end
    end
  end

  def destroy
    cart = Cart.find(params[:id])
    if cart.destroy
      flash[:alert] = "You have successfully cleared your cart."
      redirect_to home_url
    else
      flash[:error] = "Oops! we're sorry, your cart couldn't be deleted."
      redirect_to home_url
    end
  end

end
