class Post < ApplicationRecord
  belongs_to :account
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
end
