class Public::CommentsController < ApplicationController
  #before_action :authenticate_member!これを入れると管理者側でコメント削除ができない
  before_action :check_post_owner, only: [:edit, :update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = current_member.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.score = Language.get_data(comment_params[:comment])

    #ここから通知機能
    ActiveRecord::Base.transaction do
      if @comment.save
        @post.create_notification_comment!(current_member, @comment)
      else
        render 'errors'
      end
    end
    #ここまで
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment =  Comment.find(params[:id])
    unless @comment.member == current_member
      flash[:alert] = "アクセス権限がありません。"
      redirect_to root_path
    end
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def check_post_owner
    @comment =  Comment.find(params[:id])
    unless @comment.member == current_member
      flash[:alert] = "アクセス権限がありません。"
      redirect_to root_path
    end
  end

end
