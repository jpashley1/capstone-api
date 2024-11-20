class RecipeBoxesController < ApplicationController

  def index
    if current_user
      @recipe_boxes = current_user.recipe_boxes.includes(:recipe)
      render :index
    else
      render json: [], status: :ok
    end
  end

  def show 
    @recipe_box = RecipeBox.find_by(id: params[:id])
    render :show
  end

  def create
    @recipe_box = RecipeBox.new(recipe_box_params)
    @recipe_box.user_id = current_user.id
    if @recipe_box.save
      render :show
    else
      render json: { errors: @recipe_box.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_box = RecipeBox.find_by(id: params[:id])
    
    if @recipe_box
      @recipe_box.destroy
      render json: { message: "recipe has been removed" }
    else
      render json: { error: "recipe not found" }, status: :not_found
    end
  end



  private

def recipe_box_params
  params.permit(:user_id, :recipe_id)
end

end
