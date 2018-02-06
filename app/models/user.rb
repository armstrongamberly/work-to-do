class User < ApplicationRecord
	has_many :lists
	has_many :items, through: :lists
	
	has_secure_password
	validates :email, presence: true, uniqueness: true
	validates :password_digest, presence: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

end
