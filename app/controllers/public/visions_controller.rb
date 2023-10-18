class Public::VisionsController < ApplicationController
  before_action :authenticate_member!

  def index
  end

  def show
    @post = Post.find(params[:post_id])
    @vision = Vision.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @vision = Vision.new
  end

  def create
    @post = Post.find(params[:post_id])
    @vision = Vision.new(vision_params)
    @vision.member_id = current_member.id
    @vision.post_id = params[:post_id]
    if @vision.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to post_vision_path(@post,@vision)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @vision = Vision.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @vision = Vision.find(params[:id])
    if @vision.update(vision_params)
      flash[:notice] = "投稿情報を更新しました。"
      redirect_to post_vision_path(@post, @vision)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @vision = Vision.find(params[:id])
    @vision.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to post_path(@post)
  end

  private

  def vision_params
    params.require(:vision).permit(:closing_day, :improvement, :double_check )
  end

end
