class Quiz < ActiveRecord::Base
	has_many :quiz_words
	has_many :words, through: :quiz_words
end
