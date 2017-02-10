class Semester < ApplicationRecord

  has_many :users_semesters_enrollments
  has_many :users, :through => :users_semesters_enrollments
  has_many :courses
  accepts_nested_attributes_for :courses

  scope :sort_by_position, -> {order(:position => :asc)}

end
