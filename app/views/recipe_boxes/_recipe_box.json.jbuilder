json.id recipe_box.id
json.user_id recipe_box.user_id
json.recipe_id recipe_box.recipe_id
json.title recipe_box.recipe.title
json.ingredients recipe_box.recipe.ingredients
json.directions recipe_box.recipe.directions
json.username recipe_box.recipe.user.username

if recipe_box.recipe.image.attached?
  json.image_url url_for(recipe_box.recipe.image)
else
  json.image_url nil
end