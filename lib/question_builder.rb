require 'nokogiri'
require 'open-uri'

def build_questions(w)
	page = Nokogiri::HTML(open("http://bnc.bl.uk/saraWeb.php?qy=#{w.name}&mysubmit=Go"))
	example = page.css('html body div#solutions p')[1].text.html_safe #this needs some way to not return strange characters instead of '' and ""
	answer_array = [w.name, ]
	@quiz.category.words.sample(3).each do |word|
		answer_array << word.name
	end
	answer_array
	q = Question.create(word: w.name, quiz_id: @quiz.id, text: example, answer: answer_array)
end