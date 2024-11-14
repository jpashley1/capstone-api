class RecipeBoxesController < ApplicationController

  def index
    @recipe_boxes = RecipeBox.where(user_id: current_user.id)
    render :index
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


  private

def recipe_box_params
  params.permit(:user_id, :recipe_id)
end

end
