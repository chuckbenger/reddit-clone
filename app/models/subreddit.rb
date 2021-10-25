class Subreddit < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: :true
  validates :description, presence: true

  def self.search(text)
    Subreddit.where('name like ?', "%#{text}%")
  end
end
