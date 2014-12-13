class Doctor < ActiveRecord::Base
	has_many :case_logs
	has_many :images, through: :case_logs
	has_many :shares

	validates :email, :presence => true, :uniqueness => true, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	attr_accessor :password_confirmation  
	validates :password, confirmation: true
	validates :license, :presence => true, :uniqueness => true
	validates_presence_of :name, :state, :password
end