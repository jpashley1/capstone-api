require 'csv' 

# file = File.join(Rails.root, "db", "recipe_pizza_data.csv")
# CSV.foreach(file) do |row| 
#   title = row[0]

#   ingredients = row[1]

#   directions = row[2]

#   user_id = row[3]


#   Recipe.create(title: title, ingredients: ingredients, directions: directions, user_id: user_id)
# end
file = File.join(Rails.root, "db", "posts_pizza_data.csv")
CSV.foreach(file) do |row| 
  caption = row[0]

  user_id = row[1]

  

  Post.create(caption: caption, user_id: user_id)
end
