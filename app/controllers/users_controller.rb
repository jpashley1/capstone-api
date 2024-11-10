class UsersController < ApplicationController
  include Rails.application.routes.url_helpers

  def create
    user = User.new(user_params)
    if user.save
      render json: { message: "User created successfully", user: { id: user.id, username: user.username, email: user.email } }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find(params[:id]) # assign user to @user for jbuilder
    if @user.update(user_params.compact_blank)
      render partial: "users/user", locals: { user: @user }
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def my_profile_show
    @user = User.find(current_user.id)
    render :show
  end

  private
  
  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :username, :bio, :profile_pic)
  end
end
