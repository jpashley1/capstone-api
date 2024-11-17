json.id recipe.id
json.title recipe.title
json.ingredients recipe.ingredients
json.directions recipe.directions
json.user_id recipe.user_id
json.username recipe.user.username 
json.created_at recipe.created_at
json.updated_at recipe.updated_at



# Handle multiple images
if recipe.image.attached?
  json.image_url url_for(recipe.image)
else
  json.image_url nil
end

json.comments recipe.comments do |comment|
  json.id comment.id
  json.user_id comment.user_id
  json.username comment.user.username
  json.content comment.content
  json.created_at comment.created_at
  json.updated_at comment.updated_at
end