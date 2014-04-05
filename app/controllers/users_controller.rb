# encoding: utf-8
class UsersController < ApplicationController
	include SessionsHelper

	before_action :signed_in_user, only: [:edit, :update]
	before_action :correct_user,   only: [:edit, :update]
  	def new
  		@title = "Sign Up"
  		@user = User.new
   	end

   	def index
	    @users = User.paginate(page: params[:page], :per_page => 10)
   	end

  	def show
		@user = User.find(params[:id])  
 	end

 	def edit
	    @user = User.find(params[:id])
	end


	def update
	    @user = User.find(params[:id])
	    if @user.update_attributes(user_params)
	      flash[:success] = "Profile updated"
      	  redirect_to @user
	    else
	      render 'edit'
	    end
	end
	

	def create
		
		@user = User.new(user_params)

	    if @user.save
	      sign_in @user
	      flash[:success] = "Welcome to the Sample App!"
	      redirect_to @user
	    else
	      render 'new'
	    end
	end

	# user = User.create(:nickname => "foo", :email => "foo@bar.com", :password => "foobar", password_confirmation  => "foobar")
	private

	def user_params
		params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :avatar_url )
	end


	# Before filters

	def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end	