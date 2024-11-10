json.id post.id
json.user_id post.user_id
json.caption post.caption
json.created_at post.created_at
json.updated_at post.updated_at

# Handle multiple images
if post.image.attached?
  json.image_url url_for(post.image)
else
  json.image_url nil
end


