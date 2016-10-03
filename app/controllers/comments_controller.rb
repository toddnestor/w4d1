class CommentsController < ApplicationController
  def index
    if params[:user_id]
      target = 'user'
      target_id = params[:user_id]
    else params[:contact_id]
      target = 'contact'
      target_id = params[:contact_id]
    end

    comments = Comment.where(commentable_id: target_id, commentable_type: target)

    render json: comments.all
  end

  private
  def required_params
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id, :commenter_id)
  end
end
