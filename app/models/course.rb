class Course < ApplicationRecord

  belongs_to :semester
  has_many :users_courses_enrollments
  has_many :users, :through => :users_courses_enrollments

  scope :unassigned, -> { where( :is_assigned => false ) }
  scope :courses_under, -> (semester_id){ where(:semester_id => semester_id) }

  def change_in_course_state
    update_attribute(:is_assigned, !is_assigned)
    # if is_assigned == 0
    #   update_attribute(:is_assigned, true)
    # else
    #   !update_attribute(:is_assigned, true)
    # end
  end

  def remove_semester_association
      update_attribute(:is_assigned, false)
      update_attribute(:semester_id, nil)
  end

end
