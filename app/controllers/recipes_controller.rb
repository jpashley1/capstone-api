class RecipesController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :authenticate_user, except: [:index, :show, :my_recipes_index, :my_recipes_show, :user_recipes]  

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe
      render :show
    else
      render json: { error: "Recipe not found" }, status: :not_found
    end
  end

  def my_recipes_index
    if current_user
      @recipes = Recipe.where(user_id: current_user.id)
      render :index
    else
      render json: { error: "You must be logged in to view your recipes" }, status: :unauthorized
    end
  end
 
  def user_recipes
    @recipes = Recipe.where(user_id: params[:id])
    render :index
  end

  def my_recipes_show
    if current_user
      @recipe = Recipe.find_by(id: params[:id], user_id: current_user.id)
      
      if @recipe
        render :show
      else
        render json: { error: "Recipe not found" }, status: :not_found
      end
    else
      render json: { error: "You must be logged in to view your recipes" }, status: :unauthorized
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    
    if @recipe.save
      render :show
    else
      render json: { errors: @recipe.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    
    if @recipe.nil?
      render json: { error: "Recipe not found" }, status: :not_found
      return
    end

    # Check if current user owns this recipe
    if @recipe.user_id != current_user.id
      render json: { error: "Unauthorized to update this recipe" }, status: :forbidden
      return
    end
    
    if @recipe.update(recipe_params)
      render :show
    else
      render json: { errors: @recipe.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    
    if @recipe.nil?
      render json: { error: "Recipe not found" }, status: :not_found
      return
    end

    # Check if current user owns this recipe
    if @recipe.user_id != current_user.id
      render json: { error: "Unauthorized to delete this recipe" }, status: :forbidden
      return
    end

    @recipe.destroy
    render json: { message: "Recipe has been removed" }
  end

  private

  def recipe_params
    params.permit(:title, :ingredients, :directions, :image)
  end
end