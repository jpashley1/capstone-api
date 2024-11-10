class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_pic
  has_many :recipes

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

end