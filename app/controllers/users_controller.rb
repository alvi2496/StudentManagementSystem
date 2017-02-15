class UsersController < ApplicationController
  before_action :ensure_current_user_has_a_value

  def index
    # if current_user.is_admin
    #   render("admin")
    # else

    #   render("student")
    # end
  end

  def show
  end

  def edit

  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      flash[:notice] = "Profile updated successfully"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Update Unseccessful"
      render("edit")
    end
  end

  private

  def ensure_current_user_has_a_value
    unless current_user.present?
      redirect_to new_user_session_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :date_of_birth, :sex, :address, :contact_number, :image_url)
  end
end
