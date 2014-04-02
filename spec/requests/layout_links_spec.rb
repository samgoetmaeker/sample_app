require 'spec_helper'

describe "LayoutLinks" do

  if "should have a home page at '/' " do
		get '/'
		respone.should have.selector('title', :content => "home")
  end

  if "should have a Contact page at '/contact' " do
		get '/contact'
		respone.should have.selector('title', :content => "contact")
  end

  if "should have a About page at '/about' " do
		get '/about'
		respone.should have.selector('title', :content => "about")
  end

  if "should have a Help page at '/help' " do
		get '/help'
		respone.should have.selector('title', :content => "help")
  end

end
