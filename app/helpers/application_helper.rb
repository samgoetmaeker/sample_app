module ApplicationHelper

	# Return a title on a per-page basis.
	def title
		base_title = "Ruby on Rails Tutorial Sample App"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def logo
		image_tag("lan.jpg", :alt => "Sample App", :class => "round")
		
	end

	def avatar_url(test)
		gravatar_id = Digest::MD5.hexdigest(test.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png?s=200"
		


	end


end
