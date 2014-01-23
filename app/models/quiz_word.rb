class QuizWord < ActiveRecord::Base
	belongs_to :quiz
	belongs_to :word
end
