module ApplicationHelper
	def to_blank(body, word)
		body.sub(word, '_____')
	end

	def ng_clean(text)
		text.sub(/([^\s]+\s+[^\s]+[\s])/, '')
	end

	def flash_class(level)
		case level
			when :notice then "alert alert-info alert-dismissable"
			when :success then "alert alert-info alert-dismissable"
			when :error then "alert alert-info alert-dismissable"
			when :alert then "alert alert-info alert-dismissable"
		end
	end	
end
