class Post < ApplicationRecord
  has_rich_text :body

  belongs_to :author, class_name: "User"
  has_many :likes, foreign_key: :liked_post_id, inverse_of: :liked_post
  has_many :liking_users, through: :likes, class_name: "User"

  validates :title,
    presence: true

  validates :body,
    presence: true

  def liked_by?(user)
    likes.where(liking_user: user).exists?
  end
end
