class ChangeCoursesColumnDataType < ActiveRecord::Migration[5.0]
  def change
    change_column :courses, :is_assigned, :boolean
  end
end
