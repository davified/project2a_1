class User < ApplicationRecord
  has_secure_password
  has_many :posts
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
  before_save { self.email = email.downcase }
end
