class Share < ActiveRecord::Base
	belongs_to :case_log
	belongs_to :doctor
	attr_accessor :doctor_email  

	def self.shared_by(doctor)
		Share.joins(:case_log).where(case_logs: { doctor_id: doctor.id })
	end

end
