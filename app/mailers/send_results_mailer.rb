class SendResultsMailer < ApplicationMailer

  def email_result(user, semester)
    @semester = semester
    @user_courses = UsersCoursesEnrollment.user_courses(user.id, semester.id)
    @user_semester = UsersSemestersEnrollment.user_semester(user.id, semester.id).first
    mail to: user.email, subject: "#{semester.name} result published"
  end
end
