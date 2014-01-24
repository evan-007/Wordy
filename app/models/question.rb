class Question < ActiveRecord::Base
	belongs_to :quiz
	serialize :answer,Array
end
