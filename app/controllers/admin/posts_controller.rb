class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    sort_by = params[:sort_by]
    if sort_by.present?
      case sort_by # 並び替えの値が何かきめる
      when "latest"
        @sort = Post.latest
      when "old"
        @sort = Post.old
      when "level_high"
        @sort = Post.where(level_status: "severe").latest
      when "level_middle"
        @sort = Post.where(level_status: "moderate").latest
      when "level_low"
        @sort = Post.where(level_status: "mild").latest
      when "vision_presence"
        @sort = Post.vision_presence.latest
      when "vision_absence"
        @sort = Post.vision_absence.latest
      end
    else
      # デフォルトは「新着順」で並び替える
      @sort = Post.latest
    end
    @posts = @sort.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @member = @post.member
  end

end
