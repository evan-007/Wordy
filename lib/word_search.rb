class Word_search

  def search(text)
  	@words = []
  	answer = []
  	Word.all.each do |word|
  		@words.push(word.name)
  	end

  	input_words = text.downcase.split(" ")
  	input_words.each do |word|
  		unless @words.include?(word)
  			answer.push(word)
  		end
  	end
  	answer
  end
end