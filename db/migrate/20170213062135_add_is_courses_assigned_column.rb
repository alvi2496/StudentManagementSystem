class AddIsCoursesAssignedColumn < ActiveRecord::Migration[5.0]
  def change
    add_column 'users_semesters_enrollments', 'is_courses_assigned', :boolean, default:false
  end
end
