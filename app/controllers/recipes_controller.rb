class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def my_recipes_index
    @recipes = Recipe.where(user_id: current_user.id)
    render :index
  end

  def my_recipes_show
    @recipe = Recipe.find_by(id: params[:id], user_id: current_user.id)
    
    if @recipe
      render :show
    else
      render json: { error: "Recipe not found" }, status: :not_found
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe
      render :show
    else
      render json: { error: "Recipe not found" }, status: :not_found
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
    
    if @recipe
      @recipe.destroy
      render json: { message: "Recipe has been removed" }
    else
      render json: { error: "Recipe not found" }, status: :not_found
    end
  end

  private

  def recipe_params
    params.permit(:title, :ingredients, :directions, :image)
  end
end