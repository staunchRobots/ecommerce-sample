class CartsController < ApplicationController
  before_filter :authenticate_user!
  layout 'products'

  def show
    # No need of begin in the start of the method. rescue always scoped to current method
    begin
      @cart = current_user.current_cart
    rescue
      redirect_to home_url, notice: 'Invalid cart'
    else # very strange construction
      respond_to do |format|
        format.html { }
        format.json { render json: @cart }
      end
    end
  end

  def destroy
    cart = Cart.find_by_id_and_user_id(params[:id], current_user.id)
    if cart.line_items.destroy_all
      current_user.reload
      flash[:alert] = "You have successfully cleared your cart."
      redirect_to home_url # the same function in else. move to after conditionals?
    else
      flash[:error] = "Oops! we're sorry, your cart couldn't be deleted."
      redirect_to home_url
    end
  end

end
