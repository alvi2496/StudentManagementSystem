class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :email, :password, :password_confirmation, :first_name, :last_name, :date_of_birth, :sex, :address, :contact_number)
    end
  end

  private
  def after_sign_out_path_for(resource_or_scope)
    resource_or_scope = nil
    new_user_session_path
  end
end
