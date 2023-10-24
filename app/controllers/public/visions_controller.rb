class Public::VisionsController < ApplicationController
  before_action :authenticate_member!
  before_action :get_post_id, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :get_vision_id, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @vision = Vision.new
  end

  def create
    @vision = Vision.new(vision_params)
    @vision.member_id = current_member.id
    @vision.post_id = params[:post_id]
    if @vision.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to post_vision_path(@post, @vision)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @vision.update(vision_params)
      flash[:notice] = "投稿情報を更新しました。"
      redirect_to post_vision_path(@post, @vision)
    else
      render :edit
    end
  end

  def destroy
    @vision.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to post_path(@post)
  end

  private

  def vision_params
    params.require(:vision).permit(:closing_day, :improvement, :double_check )
  end

  def get_post_id
    @post = Post.find(params[:post_id])
  end

  def get_vision_id
    @vision = Vision.find(params[:id])
  end

end
