class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	 # validates :name, presence: true, uniqueness: true
	# validates :email, presence: true, uniqueness: true
	# has_secure_password
	has_many :lists, dependent: :destroy
end
