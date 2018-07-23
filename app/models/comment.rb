class Comment < ApplicationRecord
  belongs_to :article
  # validates_associated :articles
  validates :commenter, :body, presence: true
end
