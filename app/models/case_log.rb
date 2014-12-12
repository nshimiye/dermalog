class CaseLog < ActiveRecord::Base
	belongs_to :doctor
	has_many :images
	has_many :shares
	validates_presence_of :title, :patient_name
end
