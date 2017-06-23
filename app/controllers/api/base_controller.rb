module Api
  class BaseController < ActionController::Base

    before_action :require_login!
    helper_method :user_signed_in?, :current_user

    def user_signed_in?
      current_user.present?
    end

    def require_login!
      @current_user = authenticate_token
      return true if authenticate_token && !@current_user.is_admin
      render json: { errors: [{ details: 'Access Denied' }] }, status: 401
    end

    def current_user
      @current_user ||= authenticate_token
    end

    private

    def authenticate_token
      authenticate_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end
  end
end
