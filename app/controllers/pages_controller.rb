class PagesController < ApplicationController
  def home
  	@title = "home"
  end

  def contact
  	@title = "contact"
  end

  def rules
  	@title = "rules"
  end

  def help
  	@title ="help"
  end
  
end
