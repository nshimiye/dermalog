class DermalogController < ApplicationController
  def index
  	if current_user
  		redirect_to current_user
  	else
  		redirect_to login_path
  	end
  end

  def forgot_password

  end

  def retrieve_password
  	email = params[:email]
  	if email == ""
  		redirect_to forgot_password_path, notice: "Email field is blank"
  		return 
  	end
  	doctor = Doctor.find_by_email(email)
  	if doctor
	  	UserMailer.forgot_password(doctor).deliver
  		redirect_to forgot_password_path, notice: "Your password was sent"
  		return 
  	else
  		redirect_to forgot_password_path, notice: "No user has this email"
  		return 
  	end
  end

end
