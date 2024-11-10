json.id recipe.id
json.title recipe.title
json.ingredients recipe.ingredients
json.directions recipe.directions
json.user_id recipe.user_id


# Handle multiple images
if recipe.image.attached?
  json.image_url url_for(recipe.image)
else
  json.image_url nil
end