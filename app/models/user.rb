class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image_url, ImageUploader

  has_many :users_semesters_enrollments
  has_many :users_courses_enrollments
  has_many :semesters, :through => :users_semesters_enrollments
  has_many :courses, :through => :users_courses_enrollments

end
