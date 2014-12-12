class Share < ActiveRecord::Base
	belongs_to :case_log
	belongs_to :doctor
	attr_accessor :doctor_email  
end
