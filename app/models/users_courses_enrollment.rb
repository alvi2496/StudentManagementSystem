class UsersCoursesEnrollment < ApplicationRecord

  belongs_to :user
  belongs_to :course

  scope :find_user_semester, -> (user_id, course_id){ find_by(user_id: user_id, course_id: course_id)}
  scope :user_courses, -> ( user_id, semester_id ){ where( user_id: user_id, semester_id: semester_id )}

end
