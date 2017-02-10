class AddPositionColumnToSemester < ActiveRecord::Migration[5.0]
  def change
    add_column "semesters", "position", :integer
  end
end
