class RecipeBoxController < ApplicationController

  def index
  render json: {message: "box index"}
  end

  def show 
    render json: {message: "box show"}

  end

end
