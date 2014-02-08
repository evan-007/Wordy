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
    if page.css('entry_list entry dt').first.text?
      return page.css('entry_list entry dt').first.text
    end
  end

  def get_words(text, list_id)
      words = text.split(' ')
      words.each do |word|
        #how to check if word is correct or not? how to escape if word exists?!?!?
        new_word = Word.create(name: word, ngsl: false )
        Wordlist.create(word_id: new_word.id, list_id: list_id)
        # example = Wordnik.word.get_top_example(word)['text']
      end
  end

  private

    def key
      @key = '3b84ccd5-22a9-44ce-b22e-e5ffbef8e3b1'
    end
end