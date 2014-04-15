 class ChallengesController < ApplicationController 
	include SessionsHelper

	def new
  		@challenge = Challenge.new
   	end
	
	def create
		@challenge = current_user.challenges.build(challenges_params)
	    if @challenge.save
	      flash[:success] = "challenge created!"
	      redirect_to challenges_path
	    else
	      render root_url
	      flash[:success] = "Retry to create challenge!"
	    end
	end

	def destroy
	end

	def index
		@challenge = Challenge.all
	end

	private

    def challenges_params
      params.require(:challenge).permit(:playere_one, :playere_two)
    end
end