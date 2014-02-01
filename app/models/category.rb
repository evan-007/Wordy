class Category < ActiveRecord::Base
	has_many :word_categories
	has_many :words, through: :word_categories
	has_many :quizzes
	belongs_to :user
	validates :name, presence: true
end
