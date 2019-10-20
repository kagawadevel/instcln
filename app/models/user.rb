class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255}
  before_validation { email.downcase! }
  validates :password, presence: true, length: { minimum: 6 }
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_secure_password
end
