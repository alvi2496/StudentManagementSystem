class AddColumnsToUsersSemesterEnrollments < ActiveRecord::Migration[5.0]
  def change
    add_column "users_semesters_enrollments", "is_completed", :boolean, :default => false
    add_column "users_semesters_enrollments", "is_current",  :boolean, :default => false
    add_column "users_semesters_enrollments", "gpa", :float, :default => 0.00
  end
end
