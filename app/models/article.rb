class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	# validates_associated :comments
	validates :title, presence: true, length: {minimum: 5}
	validates :text, presence: true
end
