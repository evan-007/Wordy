class Question < ActiveRecord::Base
	belongs_to :quiz
	serialize :answer,Array
	before_update :grade
	acts_as_list scope: :quiz


	private

		def grade
			if self.guess == self.word
				self.correct = true
			else
			    self.correct = false
			end
		end
end
