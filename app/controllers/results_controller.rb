class ResultsController < ApplicationController

  def index
  end

  def show
    @semester = Semester.find(params[:id])
    @all_students = @semester.users
    current_student_ids = UsersSemestersEnrollment.current_users(@semester.id)
    @current_students = []
    current_student_ids.each do |id|
        @current_students << User.find(id.user_id)
    end
  end

  def new

  end

  def add_new
    current_semester = UsersSemestersEnrollment.current_semester(params[:student_id]).first
    @user_id = params[:student_id]
    if current_semester
      @current_semester_id = current_semester.semester_id
      @courses = UsersCoursesEnrollment.user_courses(params[:student_id], @current_semester_id)
    end
  end

  def create_new
    semester = UsersSemestersEnrollment.find_by(user_id: params[:student_id], :semester_id => params[:semester_id])
    user = User.find(params[:student_id])
    total_points = 0.0
    total_credit = 0.0
    is_passed = true
    params[:result].each do |r|
      if params[:result][r].to_i == 0
        is_passed = false
        break
      else
        course_result = UsersCoursesEnrollment.find(r.to_i)
        credit = Float(Course.find(course_result.course_id).course_credit)
        course_result.update_attribute(:grade_point, params[:result][r])
        total_points += Float(params[:result][r])*credit
        total_credit += credit
      end
    end

    if is_passed
      gpa = total_points/total_credit
      semester.update_attribute(:gpa, gpa)
      semester.update_attribute(:is_completed, true)
      semester.update_attribute(:is_current, false)
    end
    flash[:notice] = 'Result Updated Successfully'
    result_semester = Semester.find(semester.semester_id)
    SendResultsMailer.email_result(user,result_semester).deliver
    redirect_to result_path(semester.semester_id)
  end

  def edit_existing
    @courses = UsersCoursesEnrollment.user_courses(params[:student_id], params[:semester_id])
    @user_id = params[:student_id]
    @semester_id = UsersCoursesEnrollment.find_by(:semester_id => params[:semester_id]).semester_id
  end

  def update

  end

end
