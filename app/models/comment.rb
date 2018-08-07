class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  # validates_associated :articles
  validates :body, presence: true
end
