class UsersCoursesEnrollmentsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @course_assignment = UsersCoursesEnrollment.new
    @semester = UsersSemestersEnrollment.current_semester(current_user.id).first
    @courses = Course.courses_under(@semester.semester_id)
  end

end
