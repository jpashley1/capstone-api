class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :recipe_boxes
  has_many :users_who_saved, through: :recipe_boxes, source: :user
  has_many :comments, as: :commentable, dependent: :destroy

end
