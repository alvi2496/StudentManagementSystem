class UsersController < ApplicationController

  def index
    if current_user.present?
      if current_user.is_admin
        render("admin")
      else
        render("student")
      end
    else
      redirect_to new_user_session_path
    end
  end

  def show
  end

  def edit

  end
  def update

  end
end
