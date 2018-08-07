class User < ApplicationRecord
	# enum: [:member, :admin, :premium_user]

	has_many :articles, dependent: :destroy
	has_many :comments
	belongs_to :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessible :email, :password, :password_confirmation, :remember_me

  def username
  	self.email.split('@')[0].capitalize
  end
end
