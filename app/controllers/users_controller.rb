# encoding: utf-8
class UsersController < ApplicationController
  	def new
  		@title = "Sign Up"
  		@user = User.new
   	end

  	def show
		@user = User.find(params[:id])  
 	end

	def create
		
		@user = User.new(user_params)

		if @user.save 
			redirect_to @user
		else
			render "new"
		end
	end

	# user = User.create(:nickname => "foo", :email => "foo@bar.com", :password => "foobar", password_confirmation  => "foobar")
	private

	def user_params
		params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :avatar_url )
	end
end	