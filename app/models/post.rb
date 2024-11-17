class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, as: :commentable, dependent: :destroy
  
  def display_image
    # Convert .HEIC to .JPEG and resize to limit when accessed
    if image.attached? && image.blob.filename.extension.downcase == 'heic'
      image.variant(format: :jpg, resize_to_limit: [500, 500]).processed
    else
      image
    end
  end
  
end
