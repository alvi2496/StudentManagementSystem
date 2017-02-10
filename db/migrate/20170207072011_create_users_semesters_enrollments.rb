class CreateUsersSemestersEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :users_semesters_enrollments do |t|
      t.integer "user_id"
      t.integer "semester_id"
      t.timestamps
    end
    add_index("users_semesters_enrollments", ['user_id', 'semester_id'])
  end
end
