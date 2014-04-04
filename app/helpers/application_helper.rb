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

	  # Returns the Gravatar for the given user.
        def gravatar_for(user, options = { size: 50 })
            gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            size = options[:size]
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        end


end
