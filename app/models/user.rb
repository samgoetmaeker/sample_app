class User < ActiveRecord::Base
	#attr_accessible :name, :email, :password, :password_confirmation
	#attr_acessor :password
	has_secure_password 


	before_save { self.email = email.downcase }

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :nickname, 	:presence => true,
							:length => { :maximum => 50 }
	validates :email, 		:presence => true,
							:uniqueness => { :case_sensitive => false },
							:format => { :with => email_regex }
	validates :password,	:presence => true,
							
end
