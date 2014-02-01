require 'nokogiri'
require 'open-uri'

class WordSearch

  def search(text)
  	@words = []
  	answer = []
  	Word.all.each do |word|
  		@words.push(word.name)
  	end

  	input_words = text.downcase.split(" ")
    clean_words = input_words.each do |word|
      word.gsub!(/\W+|\d+/, '')
    end
  	clean_words.each do |word|
  		unless @words.include?(word)
  			answer.push(word)
  		end
  	end
  	answer
  end

  def get_def(word)
    @ref = "/xml/"
    page = Nokogiri::HTML(open("http://www.dictionaryapi.com/api/v1/references/learners/xml/#{word}?key=3b84ccd5-22a9-44ce-b22e-e5ffbef8e3b1"))
    definition = page.css('entry_list entry dt').first.text
      return definition
  end

  private

    def key
      @key = '3b84ccd5-22a9-44ce-b22e-e5ffbef8e3b1'
    end
end