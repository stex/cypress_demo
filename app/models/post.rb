class Post < ApplicationRecord
  has_rich_text :content

  belongs_to :account
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
end
