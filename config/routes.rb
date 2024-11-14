Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post "/users" => "users#create"
  patch "users/:id" => "users#update"
  get "/my_profile" => "users#my_profile_show"
  get "/users" => "users#index"
  get "/users/:id" => "users#show"

  post "/sessions" => "sessions#create"


  get "/recipes" => "recipes#index"
  get "/my_recipes" => "recipes#my_recipes_index"
  get "/my_recipes/:id" => "recipes#my_recipes_show"
  get "/user_recipes/:id" => "recipes#user_recipes"
  get "/recipes/:id" => "recipes#show"
  post "/recipes" => "recipes#create"
  patch "/recipes/:id" => "recipes#update"
  delete "/recipes/:id" => "recipes#destroy"
  get "/recipe_box/" => "recipe_box#index"
  get "/recipe_box/:id" => "recipe_box#show"
 
  get "/posts" => "posts#index"
  get "/my_posts" => "posts#my_posts_index"
  get "/my_posts/:id" => "posts#my_posts_show"
  get "/user_posts/:id" => "posts#user_posts"
  get "/posts/:id" => "posts#show"
  post "/posts" => "posts#create"
  patch "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"
  # Defines the root path route ("/")
  # root "posts#index"
end
