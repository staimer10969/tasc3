class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_current_user
	  @current_user = User.find_by(id: session[:user_id])
  end

  #def authenticate_user
	 #if @current_user == nil
		 #flash[:notice] = "ログインが必要です"
		 #redirect_to("/sign_in")
	 #end
  #end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :username, :password, :remember_me]
  end

  add_flash_types :success, :info, :warning, :danger

end
