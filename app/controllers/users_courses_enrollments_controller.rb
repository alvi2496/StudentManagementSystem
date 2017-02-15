class UsersCoursesEnrollmentsController < ApplicationController

  def index
  end

  def show
  end

  def new
    semester = UsersSemestersEnrollment.current_semester(current_user.id).first
    if semester
      unless semester.is_courses_assigned
        @course_assignment = UsersCoursesEnrollment.new
        @courses = Course.courses_under(semester.semester_id)
      end
    end
  end

  def create
    @semester_id = UsersSemestersEnrollment.current_semester(current_user.id).first.semester_id
    params['users_courses_enrollment']['course_id'].each do |course|
      if course.to_s != ""
        current_user.courses << Course.find(course)
        UsersCoursesEnrollment.find_user_semester(current_user.id, course).update_attribute(:semester_id, @semester_id)
      end
    end
    UsersSemestersEnrollment.user_semester(current_user.id, @semester_id).first.update_attribute(:is_courses_assigned, true)
    redirect_to users_path
  end

  def edit
    current_semester_id = UsersSemestersEnrollment.current_semester(params[:id]).first.semester_id
    @courses = UsersCoursesEnrollment.user_courses(params[:id], current_semester_id)
  end

  private
  def permit_params
    params.require(:users_courses_enrollment).permit(:user_id, :semester_id, :course_id)
  end

end
