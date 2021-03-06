module ApplicationHelper
  
  def get_text(word) 
    Wordnik.word.get_top_example(word)['text']
  end
  
  def get_scrambled(word)
    Wordnik.word.get_top_example(word)['text'].split(' ').shuffle.join(' ')
  end
  
	def to_blank(body, word)
		body.sub(/\b(?i:#{word})\b/, '_____')
	end

	def ng_clean(text)
		text.sub(/([^\s]+\s+[^\s]+[\s])/, '')
	end

	def flash_class(level)
		case level
			when :notice then "alert alert-info alert-dismissable"
			when :success then "alert alert-success alert-dismissable"
			when :error then "alert alert-danger alert-dismissable"
			when :alert then "alert alert-warning alert-dismissable"
		end
	end	
end
