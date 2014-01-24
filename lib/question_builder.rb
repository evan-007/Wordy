require 'nokogiri'
require 'open-uri'

def build_questions(w)
	page = Nokogiri::HTML(open("http://bnc.bl.uk/saraWeb.php?qy=#{w.name}&mysubmit=Go"))
	example = page.css('html body div#solutions p')[1].text.html_safe #this needs some way to not return strange characters instead of '' and ""
	q = Question.create(word: w.name, quiz_id: @quiz.id, text: example, answer: [w.name].push(@quiz.category.words.sample(3)))
end

# @quiz.category.words.each do |w| #refactor this mess out of the controller!!!
# 				page = Nokogiri::HTML(open("http://bnc.bl.uk/saraWeb.php?qy=#{w.name}&mysubmit=Go"))
# 				example = page.css('html body div#solutions p')[1].text.html_safe #this needs some way to not return strange characters instead of '' and ""
# 				q = Question.create(word: w.name, quiz_id: @quiz.id, text: example, answer: [w.name].push(@quiz.category.words.sample(3)))
# 				end