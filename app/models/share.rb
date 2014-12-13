class Share < ActiveRecord::Base
	belongs_to :case_log
	belongs_to :doctor
	attr_accessor :doctor_email  

	def self.shared_by(doctor)
		Share.joins(:case_log).where(case_logs: { doctor_id: doctor.id })
	end

	def self.has_access_to_case_log(doctor, case_log)
		Share.find_by(doctor_id: doctor.id, case_log_id: case_log.id)
	end

end
