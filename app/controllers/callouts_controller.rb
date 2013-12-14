class CalloutsController < ApplicationController

  def index
    @media_callouts = Callout.all.select { |c| c.is_callout? }
    @story_suggests = Callout.all.select { |c| c.is_suggestion? }
  end

  def show
    @callout = Callout.find(params[:id])
    @reply = @callout.replies.build
    unless is_source? || current_user.id == @callout.user_id
      redirect_to callouts_path, notice: 'Sorry, you do not have access to this callout'
    end
  end

  def new
    @callout = Callout.new
    @location_interests = Interest.all.map { |i| i if i.topic == "Location" }.compact
    @issue_interests = Interest.all.map { |i| i if i.topic == "Issue" }.compact
    @selected_interests = []
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
    unless is_source? || current_user.id == @callout.user_id
      redirect_to callouts_path, notice: 'Sorry, you do not have access to this callout'
    end
  end

  private
  def callout_params
    params.require(:callout).permit(:subject, :deadline, :description, :user_id)
  end

end
