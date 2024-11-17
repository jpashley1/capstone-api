json.id post.id
json.user_id post.user_id
json.username post.user.username 
json.caption post.caption
json.created_at post.created_at
json.updated_at post.updated_at

# Handle multiple images
if post.image.attached?
  json.image_url url_for(post.image)
else
  json.image_url nil
end

# Include comments
json.comments post.comments do |comment|
  json.id comment.id
  json.user_id comment.user_id
  json.username comment.user.username
  json.content comment.content
  json.created_at comment.created_at
  json.updated_at comment.updated_at
end
