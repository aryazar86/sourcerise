class CalloutsController < ApplicationController

  def index
    @callouts = Callout.all
  end

  def show
    @callout = Callout.find(params[:id])
  end

  def new
    @callout = Callout.new
  end

  def create
    @callout = Callout.new(callout_params)
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
