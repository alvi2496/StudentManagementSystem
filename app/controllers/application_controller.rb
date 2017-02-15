class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :find_semesters
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :email, :password, :password_confirmation, :first_name, :last_name, :date_of_birth, :sex, :address, :contact_number, :image_url)
    end
  end

  private
  def after_sign_out_path_for(resource_or_scope)
    resource_or_scope = nil
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    users_path
  end

  def ensure_if_admin
    unless current_user.is_admin
      render file: 'public/404.html'
    end
  end

  def ensure_if_signed_in
    unless signed_in?
      redirect_to new_user_session_path
    end
  end

  def find_semesters
    @semesters = Semester.sort_by_position
  end

end
