class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:index, :new, :create]

  def show
    @user = User.find(params[:id])
    @callouts = Callout.all.map { |c| c if @user.id == c.user_id }

    @replied_to_callouts = []
    if current_user == @user 
      Callout.all.each do |c| 
        c.replies.each do |d|
          if d.sender == current_user && c.user != current_user
            @replied_to_callouts << c
          end 
        end
      end
    end

    @replied_to_callouts.uniq!

    unless @user == current_user || (current_user.is_media? && @user.is_source?)
      redirect_to user_path(current_user), notice: 'You may only view your own profile'
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
      if params[:interests] != nil
        @user.interests << Interest.find(params[:interests])
      end
      auto_login(@user)
      redirect_to :root, notice: 'User was successfully created'
    else
      flash.now[:alert] = "Whoops, try again!"
      render 'users/register_fail'
    end
  end

  def edit
    @user = User.find(params[:id])

    if @user == current_user
      @location_interests = Interest.all.map { |i| i if i.topic == "Location" }.compact
      @issue_interests = Interest.all.map { |i| i if i.topic == "Issue" }.compact
      @selected_interests = @user.interests
    else
      redirect_to user_path(current_user), notice: 'You may only edit your own profile'
    end

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      @user.interests = Interest.find(params[:interests])
      redirect_to user_path(current_user), notice: "Profile updated successfully!"
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
    params.require(:user).permit(:email, :password, :password_confirmation, :user_role_id, :bio, :first_name, :last_name, :organization, :location, :image)
  end

end
