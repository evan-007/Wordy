class QuizList < ActiveRecord::Base
  belongs_to :list
  belongs_to :quiz
end
