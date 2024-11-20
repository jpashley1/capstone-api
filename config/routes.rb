Rails.application.routes.draw do
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
  get '/recipes_search', to: 'recipes#search'


  get "/recipe_box" => "recipe_boxes#index"
  get "/recipe_box/:id" => "recipe_boxes#show"
  post "/recipe_box" => "recipe_boxes#create"
  delete "/recipe_box/:id" => "recipe_boxes#destroy"
 
  get "/posts" => "posts#index"
  get "/my_posts" => "posts#my_posts_index"
  get "/my_posts/:id" => "posts#my_posts_show"
  get "/user_posts/:id" => "posts#user_posts"
  get "/posts/:id" => "posts#show"
  post "/posts" => "posts#create"
  patch "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"

  resources :posts do
    resources :comments, only: [:index, :create]
  end

  resources :recipes do
    resources :comments, only: [:index, :create]
  end

  resources :comments, only: [:show, :update, :destroy]
end
 


