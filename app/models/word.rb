class Word < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :wordlists
	has_many :lists, through: :wordlists
	has_many :word_categories
	has_many :categories, through: :word_categories
end
