class Recipe < ApplicationRecord
  belongs_to :user
  # has_many_attached :images
  has_one_attached :image
end
