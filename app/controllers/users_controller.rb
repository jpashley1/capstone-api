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
    @user = User.find(params[:id])
    
    if @user.update(user_params.except(:profile_pic).compact_blank)
      if params[:profile_pic]
        @user.profile_pic.attach(params[:profile_pic])
      end
  
      render partial: "users/user", locals: { user: @user }
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  def my_profile_show
    @user = User.find(current_user.id)
    render :show
  end

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end


  private
  
  def user_params
    permitted_params = {}
    permitted_params[:id] = params[:id] if params[:id].present?
    permitted_params[:name] = params[:name] if params[:name].present?
    permitted_params[:email] = params[:email] if params[:email].present?
    permitted_params[:password] = params[:password] if params[:password].present?
    permitted_params[:password_confirmation] = params[:password_confirmation] if params[:password_confirmation].present?
    permitted_params[:username] = params[:username] if params[:username].present?
    permitted_params[:bio] = params[:bio] if params[:bio].present?
    permitted_params[:profile_pic] = params[:profile_pic] if params[:profile_pic].present?
    permitted_params
  end
end
