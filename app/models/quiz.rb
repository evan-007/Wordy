class Quiz < ActiveRecord::Base
	belongs_to :user
	has_many :quiz_words
	has_many :words, through: :quiz_words #quiz words is replaced by quiz lists
	has_many :quiz_lists
	has_many :lists, through: :quiz_lists
	validates :name, presence: true
end
