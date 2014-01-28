class Question < ActiveRecord::Base
	belongs_to :quiz
	serialize :answer,Array
	before_update :some_method

	def some_method
	end
end
