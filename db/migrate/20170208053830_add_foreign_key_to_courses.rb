class AddForeignKeyToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column "courses", "semester_id", :integer
    add_index( "courses", "semester_id")
  end
end
