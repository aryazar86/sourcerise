class RepliesController < ApplicationController
  
  before_filter :load_callout
  def create
    @reply = @callout.replies.build(reply_params)
    @reply.sender_id = current_user.id
    @reply.receiver_id = @callout.user_id

    if @reply.save
      redirect_to callout_path(@callout), notice: "Reply posted"
    else
      render :action => :show, notice: "Reply failed to post"
    end
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
  
  end

  private
  def reply_params
    params.require(:reply).permit(:sender_id, :receiver_id, :comment, :callout_id)
  end

  def load_callout
    @callout = Callout.find(params[:callout_id])
  end


end