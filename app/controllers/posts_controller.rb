class PostsController < ApplicationController

def index
  @posts = Post.all
  render :index
end

def my_posts_index
  @posts = Post.where(user_id: current_user.id)
  render :index
end

def my_posts_show
  @post = Post.find_by(id: params[:id], user_id: current_user.id)  
  if @post
    render :show
  else
    render json: { error: "post not found" }, status: :not_found
  end
end

def user_posts
  @posts = Post.where(user_id: params[:id])
  render :index
end

def show
  @post = Post.find_by(id: params[:id])
  render :show
end

def create
  @post = Post.new(post_params)
  @post.user_id = current_user.id
  if @post.save
    render :show
  else
    render json: { errors: @post.errors.full_messages },
      status: :unprocessable_entity
  end
end

def update
  @post = Post.find_by(id: params[:id])
    
  if @post.nil?
    render json: { error: "post not found" }, status: :not_found
  end

  if @post.update(post_params)
    render :show
  else
    render json: { errors: @post.errors.full_messages },
      status: :unprocessable_entity
  end
end

def destroy
  @post = Post.find_by(id: params[:id])
    
  if @post
    @post.destroy
    render json: { message: "post has been removed" }
  else
    render json: { error: "post not found" }, status: :not_found
  end
end

private

def post_params
  params.permit(:caption, :image)
end

end
