class User < ActiveRecord::Base
	# attr_accessible :name, :email

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :nickname, 	:presence => true,
							:length => { :maximum => 50 }
	validates :email, 		:presence => true,
							:uniqueness => { :case_sensitive => false },
							:format => { :with => email_regex }

end
