class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :user
	paginates_per 30
	# validates_associated :comments
	validates :title, presence: true, length: {minimum: 5}
	validates :text, presence: true
end
