require 'nokogiri'
require 'open-uri'

def build_questions(word)
	page = Nokogiri::HTML(open("urltocorpus/#{word}"))
	puts page.somepath('totextiwant')
end