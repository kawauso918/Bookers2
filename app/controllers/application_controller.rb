class ApplicationController < ActionController::Base
   before_action :authenticate_user!, except: [:top]

   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_up_path_for(resource)
      user_path(resource)
  end
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end