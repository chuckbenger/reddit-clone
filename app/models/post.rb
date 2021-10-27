class Post < ApplicationRecord
  belongs_to :subreddit
  belongs_to :user
  has_many :comments

  validates :name, presence: true
  validates :description, presence: true
end
