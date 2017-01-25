class CommentsController < ApplicationController

  def create
    @event = Event.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.event_id = @event.id
    if @comment.save
      redirect_to :back, notice: "You add a comment"
    else
      redirect_to :back, alert: "Add a comment body, please"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:note)
  end
end