class User < ApplicationRecord
	has_many :lists
	has_many :items, through: :lists
	
	has_secure_password
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
	validates :email, 
		presence: true, 
		format: { with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false }
		
	validates :password_digest, 
		presence: true

end
