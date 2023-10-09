class Public::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_member.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save

    # #通知機能
    # ActiveRecord::Base.transaction do
    #   if @comment.save
    #     @post.create_notification_comment!(current_member, @comment.id)
    #   else
    #     render 'errors'
    #   end
    # end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    Comment.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
