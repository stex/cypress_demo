class User < ApplicationRecord
  has_secure_password

  validates :email,
            uniqueness: true

  has_many :posts, foreign_key: :author
end
