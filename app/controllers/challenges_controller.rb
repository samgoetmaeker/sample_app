 class ChallengesController < ApplicationController 
	include SessionsHelper
	before_action :signed_in_user

	def new
  		@challenge = Challenge.new
  		@user = User.all
  		@selected_user = @user[2]
   	end
	
	def create
		@user = User.all
		# check if users has enough coins to create a challenge
		if current_user.coins > 2	
			@challenge = current_user.challenges.build(challenges_params)
			current_user.coins -= 2
		#		@user.update_attributes
		    if @challenge.save
		      flash[:success] = "challenge created!"
		      redirect_to challenges_path
		    else
		      render root_url
		      flash[:success] = "Retry to create challenge!"
		    end
		else
			redirect_to user_path(current_user)
			flash[:success] = "with less then 2 coins it doesn't work"
		end
	end


	def destroy
	    @challenge = Challenge.find(params[:id])
	    if @challenge.present?
	      @challenge.destroy
	    end
	    redirect_to user_path(current_user)
	end

	def index
		@challenge = Challenge.all
	end

	private

    def challenges_params
      params.require(:challenge).permit(:challenge_game, :player_one, :player_two, :description)
    end


end