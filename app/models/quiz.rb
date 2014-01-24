class Quiz < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	validates :name, presence: true
	has_many :questions
end
