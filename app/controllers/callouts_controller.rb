class CalloutsController < ApplicationController

  def index
    @callouts = Callout.all
  end

  def show
    @callout = Callout.find(params[:id])
    unless current_user.user_role_id == 2 || current_user.id == @callout.user_id
      redirect_to callouts_path, notice: 'Sorry, you do not have access to this callout'
    end
  end

  def new
    @callout = Callout.new
  end

  def create
    @callout = Callout.new(callout_params)
    @callout.user_id = current_user.id
    if @callout.save
      redirect_to callouts_path, notice: 'Callout was successfully created'
    else
      render "new"
    end
  end

  def edit
    @callout = Callout.find(params[:id])
  end

  private
  def callout_params
    params.require(:callout).permit(:subject, :deadline, :description, :user_id)
  end

end
