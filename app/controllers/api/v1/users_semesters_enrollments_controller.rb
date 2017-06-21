module Api
  module V1
    class UsersSemestersEnrollmentsController < ApplicationController
      def index
        current_user = User.find(11)
        @semesters = current_user.semesters.sort_by_position
        if @semesters.count > 0
          @response = { status: 200, message: 'OK' }
        else
          @response = { status: 404, message: 'Not Found'}
        end
        response.status = @response[:status]
      end

      def show
        @semester = Semester.find(params[:id])
        @user_semester = UsersSemestersEnrollment.user_semester(current_user.id, @semester.id).first
        @user_courses = UsersCoursesEnrollment.user_courses(current_user.id, @semester.id)
      end

      def new
        @enrolled_semesters = current_user.semesters.count
        @current_semester = current_user.users_semesters_enrollments.current_semester(current_user.id)
        if @enrolled_semesters == 0
          @semester = Semester.find_by(position: (@enrolled_semesters + 1))
        elsif @current_semester.count > 0
          flash[:not_allowed] = "You are already in a semester that you have not completed yet!!"
        else
          @semester = Semester.find_by(position: (@enrolled_semesters + 1))
        end
        @enrollment = UsersSemestersEnrollment.new
      end

      def create
        @user_id = current_user.id
        @enrollment = UsersSemestersEnrollment.new(:user_id => @user_id, :semester_id => params[:semester], :is_current => true)
        if @enrollment.save
          flash[:notice] = "Semester assigned successfully"
          redirect_to users_path
        else
          flash[:notice] = "Unsuccessful"
          redirect_to users_path
        end
      end

      def edit; end

      def update; end

      private

      def permit_params
        params.require(:users_semesters_enrollment).permit(:user_id, :semester_id, :is_current)
      end
    end
  end
end
