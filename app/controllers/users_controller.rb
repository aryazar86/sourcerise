class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:index, :new, :create]



  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :login, notice: 'User was successfully created'
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user.id)
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_role_id, :bio, :first_name, :last_name, :organization, :location)
  end


end
