class Doctor < ActiveRecord::Base
	has_many :case_logs

	validates :email, :presence => true, :uniqueness => true, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	attr_accessor :password_confirmation  
	validates :password, confirmation: true
	validates_presence_of :name, :state, :password, :license, :password_confirmation
end