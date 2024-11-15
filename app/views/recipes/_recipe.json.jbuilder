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