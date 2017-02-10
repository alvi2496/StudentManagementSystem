class UsersSemestersEnrollment < ApplicationRecord

  belongs_to :user
  belongs_to :semester

  scope :current_semester, -> (user_id){ where(user_id: user_id, is_current: true)}
  scope :is_completed, -> { where(is_completed: true) }
  scope :user_semester, ->(user_id, semester_id){ where(user_id: user_id, semester_id: semester_id)}

end
