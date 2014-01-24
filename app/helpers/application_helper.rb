module ApplicationHelper
	def to_blank(body, word)
		body.sub(word, '_____')
	end

	def ng_clean(text)
		text.sub(/([^\s]+\s+[^\s]+[\s])/, '')
	end
end
