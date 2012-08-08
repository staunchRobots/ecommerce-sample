class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, only: [ :current_cart ]
  helper_method :current_cart  

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You're not authorized to access this section."
    redirect_to home_url
  end

protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
