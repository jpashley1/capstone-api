class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_pic
  has_many :recipes
  has_many :recipe_boxes
  has_many :saved_recipes, through: :recipe_boxes, source: :recipe


  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  # after_commit :convert_heic_to_jpeg, if: -> { image.attached? && image.blob.filename.extension.downcase == 'heic' }

  # private
  
  # def convert_heic_to_jpeg
  #   image.variant(format: :jpg).processed
  # end
  
end
