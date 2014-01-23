class Word < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :wordlists
	has_many :lists, through: :wordlists
	has_many :word_categories
	has_many :categories, through: :word_categories
	has_many :quiz_words #quiz words is replaced by quiz-list relation, delete these lines later
	has_many :quizzes, through: :quiz_words
end
