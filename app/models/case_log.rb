class CaseLog < ActiveRecord::Base
	belongs_to :doctor
	#has_many :images
	validates_presence_of :title, :patient_name
end
