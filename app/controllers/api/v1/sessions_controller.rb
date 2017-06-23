class Api::V1::SessionsController < Api::BaseController

  skip_before_action :require_login!, only: :create

  def create
    resource = User.find_for_database_authentication(email: params[:user_login][:email])
    resource ||= User.new

    if resource.valid_password?(params[:user_login][:password])
      auth_token = resource.generate_auth_token
      render json: { id: resource.id, auth_token: auth_token }
    else
      invalid_login_attempt
    end
  end

  def destroy
    resource = current_user
    resource.invalidate_auth_token
    render json: { message: 'Successfully Signed Out' }
  end

  private

  def invalid_login_attempt
    render json: { errors: [{ details: 'Invalid email password combination' }] }, status: 401
  end
end

