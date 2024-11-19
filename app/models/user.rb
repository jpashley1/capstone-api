class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_pic
  has_many :recipes
  has_many :recipe_boxes
  has_many :saved_recipes, through: :recipe_boxes, source: :recipe
  has_many :comments, dependent: :destroy


  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  
end
