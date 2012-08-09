class ApplicationController < ActionController::Base
  protect_from_forgery

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

end
