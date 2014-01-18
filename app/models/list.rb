class List < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user_id}
  has_many :wordlists
  has_many :words, through: :wordlists
end
