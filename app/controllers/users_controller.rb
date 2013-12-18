class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:index, :new, :create]

  def show
    @user = User.find(params[:id])
    @callouts = Callout.all.map { |c| c if @user.id == c.user_id }

    unless @user == current_user || current_user.user_role_id == 1
      redirect_to :login, notice: 'You may only view your own profile'
    end
  end

  def new
    @user = User.new
    @location_interests = Interest.all.map { |i| i if i.topic == "Location" }.compact
    @issue_interests = Interest.all.map { |i| i if i.topic == "Issue" }.compact
    @selected_interests = []
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      @user.interests << Interest.find(params[:interests])
      redirect_to :login, notice: 'User was successfully created'
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
    @location_interests = Interest.all.map { |i| i if i.topic == "Location" }.compact
    @issue_interests = Interest.all.map { |i| i if i.topic == "Issue" }.compact
    @selected_interests = @user.interests
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      @user.interests = Interest.find(params[:interests])
      redirect_to callouts_path
    else
      redirect_to edit_user_path
    end
  end

  def get_interests
    @sub_interests = Interest.all.map { |i| i if i.parent_id == params[:choice].to_i }
    
    respond_to do |format|
      format.js {}
      format.html {redirect_to new_user_path}
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_role_id, :bio, :first_name, :last_name, :organization, :location)
  end


end
