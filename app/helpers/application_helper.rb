module ApplicationHelper
	
  	

	# Return a title on a per-page basis.
	def title
		base_title = "Scoreboard Lan Party 2014"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def logo
		image_tag("lan.jpg", :alt => "Sample App", :class => "round")
	end

	def versus
		image_tag("versus.png", :class => "round")
	end


	def avatar_url(user)
		if user.avatar_url.present?
			user.avatar_url
		else
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png?s=200"
		end

	end



end
