class User < ActiveRecord::Base
	#attr_accessible :name, :email, :password, :password_confirmation
	#attr_acessor :password

	has_secure_password


	before_save { self.email = email.downcase }
	before_create :create_remember_token
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :nickname, 	:presence => true,
							:length => { :maximum => 50 }
	validates :email, 		:presence => true,
							:uniqueness => { :case_sensitive => false },
							:format => { :with => email_regex }
	validates :password,	:presence => true,
							:confirmation => true,
							:length => { :within => 6..40 }

	  def self.authenticate(email, password)
	    user = find_by_email(email)
	    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	      user
	    else
	      nil
	    end
	  end

	  def User.new_remember_token
	    SecureRandom.urlsafe_base64
	  end

	  def User.hash(token)
	    Digest::SHA1.hexdigest(token.to_s)
	  end

	  private

	    def create_remember_token
	      self.remember_token = User.hash(User.new_remember_token)
	    end
end