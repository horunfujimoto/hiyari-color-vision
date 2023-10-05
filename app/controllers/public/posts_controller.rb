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
    @post.member_id = current_member.id
    if @post.save
    redirect_to post_path(@post)
    else

    end
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :place, :tag_id, :level_status,:open_status )
  end
end
