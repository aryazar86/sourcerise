class RepliesController < ApplicationController
  
  before_filter :load_callout

  def create
    @reply = @callout.replies.build(reply_params)
    @reply.sender = current_user
    @reply.receiver_id ||= @callout.user_id

    @messenger = User.find(params[:reply][:receiver_id])
    @callout = Callout.find(params[:callout_id])
    @reply2 = @callout.replies.build

  respond_to do |format|
      if @reply.save
        format.html { redirect_to callout_path(@callout), notice: "Reply posted" }
        format.js {}
      else
        format.html { render :action => :show, notice: "Reply failed to post" }
        format.js {}
      end
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
