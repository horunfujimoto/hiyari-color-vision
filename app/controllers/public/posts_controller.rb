class Public::PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path #後で修正！
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:member_id, :tag_id, :title, :body, :place, :open_status, :level_status )
  end
end
