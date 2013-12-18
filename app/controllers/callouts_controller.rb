class CalloutsController < ApplicationController

  def index
    #@media_callouts = Callout.all.select { |c| c.is_callout? }
    @media_callouts = Callout.filter_callouts(current_user.interests).select { |c| c.is_callout? }
    #@story_suggests = Callout.all.select { |c| c.is_suggestion? }
    @story_suggests = Callout.filter_callouts(current_user.interests).select { |c| c.is_suggestion? }
  
    @location_interests = Interest.all.map { |i| i if i.topic == "Location" }.compact
    @issue_interests = Interest.all.map { |i| i if i.topic == "Issue" }.compact
    @selected_interests = current_user.interests
  end

  def show
    @callout = Callout.find(params[:id])
    @reply = @callout.replies.build
  end

  def new
    @callout = Callout.new
    @location_interests = Interest.all.map { |i| i if i.topic == "Location" }.compact
    @issue_interests = Interest.all.map { |i| i if i.topic == "Issue" }.compact
    @selected_interests = []

    
    @interested_media = User.filter_users(current_user.interests).select{|u| u.is_media?}
    @interested_sources = User.filter_users(current_user.interests).select{|u| u.is_source?}
  end

  def create
    @callout = Callout.new(callout_params)
    @callout.user_id = current_user.id

    if @callout.save
      @callout.interests << Interest.find(params[:interests])
      redirect_to callouts_path, notice: 'Callout was successfully created'
    else
      render "new"
    end
  end

  def edit
    @callout = Callout.find(params[:id])
    @location_interests = Interest.all.map { |i| i if i.topic == "Location" }.compact
    @issue_interests = Interest.all.map { |i| i if i.topic == "Issue" }.compact
    @selected_interests = @callout.interests
    unless current_user.id == @callout.user_id
      redirect_to callouts_path, notice: 'Sorry, you do not have access to this callout'
    end
  end

  def update
    @callout = Callout.find(params[:id])
    if @callout.update_attributes(callout_params)
      @callout.interests = Interest.find(params[:interests])
      redirect_to callout_path(params[:id])
    else
      redirect_to edit_callout_path
    end
  end

  def get_messages
    @callout = Callout.find(params[:calloutid].to_i)
    @reply = @callout.replies.build
    @messenger = User.find(params[:messengerid].to_i)

    respond_to do |format|
      format.js {}
    end
  end

  def sorted
    if params[:checkedinterests]
      @interests = Interest.find(params[:checkedinterests])
    else
      @interests = Interest.all
    end

    @media_callouts = Callout.filter_callouts(@interests).select { |c| c.is_callout? }
    @story_suggests = Callout.filter_callouts(@interests).select { |c| c.is_suggestion? }

    respond_to do |format|
      format.js {}
    end

  end
  
  private
  def callout_params
    params.require(:callout).permit(:subject, :deadline, :description, :user_id)
  end

end
