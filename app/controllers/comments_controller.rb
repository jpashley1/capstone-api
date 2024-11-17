class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]
  before_action :set_commentable, only: :create

  # GET /comments
  def index
    @comments = Comment.all
    render json: @comments
  end

  # GET /comments/:id
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user 

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/:id
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/:id
  def destroy
    @comment.destroy
    head :no_content
  end

  private


  # Modify this method
  def set_commentable
    if params[:post_id]
      @commentable = Post.find_by(id: params[:post_id])
    elsif params[:recipe_id]
      @commentable = Recipe.find_by(id: params[:recipe_id])
    end
    
    head :not_found unless @commentable
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    if params[:comment].is_a?(String)
      { content: params[:comment] }
    else
      params.require(:comment).permit(:content)
    end
  end
end


