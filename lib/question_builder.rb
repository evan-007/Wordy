require 'nokogiri'
require 'open-uri'

def build_questions(word)
	page = Nokogiri::HTML(open("http://bnc.bl.uk/saraWeb.php?qy=#{word}&mysubmit=Go"))
	page.css('html body div#solutions p')[1].text
end