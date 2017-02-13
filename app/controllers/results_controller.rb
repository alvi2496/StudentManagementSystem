class ResultsController < ApplicationController

  def index
    @semesters = Semester.sort_by_position
  end

  def show
    semester = Semester.find(params[:id])
    @students = semester.users
  end

  def new

  end

  def add_new
    current_semester_id = UsersSemestersEnrollment.current_semester(params[:id]).first.semester_id
    @courses = UsersCoursesEnrollment.user_courses(params[:id], current_semester_id)
  end

  def create

  end

  def edit
  end

  def update

  end

end
