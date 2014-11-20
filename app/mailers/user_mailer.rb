class UserMailer < ActionMailer::Base
  default from: "sendbeat@gmail.com"

  def forgot_password(doctor)
    @doctor = doctor
    mail to: doctor.email, subject: "[Dermalog] Your forgotten password"
  end
end
