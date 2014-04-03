class UsersController < ApplicationController
  	def new
  		@title = "Sign Up"
  		@user = User.new
  	end

  	def show
		@user = User.find(params[:id])  

 	end

	def create
		@user = User.new(params[:id])

		if @user.save
			redirect_to root_url
		else
			render "new"
		end
	end

end
