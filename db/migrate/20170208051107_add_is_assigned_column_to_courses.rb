class AddIsAssignedColumnToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column "courses", "is_assigned", :string, :default => false
  end
end
