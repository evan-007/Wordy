class Quiz < ActiveRecord::Base
	belongs_to :user
	has_many :quiz_words
	has_many :words, through: :quiz_words
end
