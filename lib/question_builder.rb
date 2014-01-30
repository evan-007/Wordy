
require 'nokogiri'
require 'open-uri'

def build_questions(w)
	page = Nokogiri::HTML(open("http://bnc.bl.uk/saraWeb.php?qy=#{w.name}&mysubmit=Go"), nil, "UTF-8")
	example = page.css('html body div#solutions p')[1].text.html_safe
	answer_array = [w.name]
	w.categories.first.words.where.not(name: w.name).sample(3).each do |word|
		answer_array << word.name
	end
	answer_array
	q = Question.create(word: w.name, quiz_id: @id, text: example, answer: answer_array)
end
