class SessionsController < ApplicationController
include SessionsHelper
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    flash.now[:error] = 'comparing'
    if user && user.authenticate(params[:session][:password])
      flash.now[:error] = 'sucseeded'
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    sign_out
    redirect_to root_path 
  end
  
end
