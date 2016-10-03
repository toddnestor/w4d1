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

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update(comment_params)
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id, :commenter_id)
  end
end
