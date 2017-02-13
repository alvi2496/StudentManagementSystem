class CreateUsersCoursesEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :users_courses_enrollments do |t|

      t.references :user, index:true
      t.references :semester, index:true
      t.references :course, index:true
      t.float "grade_point", default:0.0
      t.timestamps
    end

  end
end
