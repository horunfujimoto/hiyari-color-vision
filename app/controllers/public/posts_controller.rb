class Public::PostsController < ApplicationController

  def index
    #公開もしくは全体公開のどちらかを選択した場合は表示される
    @open_posts = Post.where(open_status: [0, 2])
                  .order(created_at: :desc)
                  .page(params[:page])
                  .per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to post_path(@post)
    else
      flash[:notice] = "投稿内容に不備があります。"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿情報を更新しました。"
      redirect_to post_path(@post)
    else
      flash[:notice] = "投稿内容に不備があります。"
      render :edit
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :place, :tag_id, :level_status,:open_status )
  end
  
end