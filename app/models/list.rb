class List < ActiveRecord::Base
  has_many :userlists
  has_many :users, through: :userlists
  validates :name, presence: true, uniqueness: { scope: :user_id}
  has_many :wordlists
  has_many :words, through: :wordlists
  # after_create :get_words

  def get_words(text)
  	words = text.split('')
  	words.each do |word|
  		#how to check if word is correct or not?
  		Word.new(name: word, ngsl: false, list: self.id )
  		# example = Wordnik.word.get_top_example(word)['text']
  	end
  end
end
