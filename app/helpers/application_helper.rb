module ApplicationHelper
	def to_blank(body, word)
		body.sub(word, '_____')
	end
end
