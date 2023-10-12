class Public::PostsController < ApplicationController
  before_action :authenticate_member!

  def index
    # 公開もしくは全体公開のどちらかを選択した場合は表示される
    # current_member の company_password カラムと一致する投稿のみを取得
    @open_posts = Post.where(open_status: [0, 2])
                  .joins(:member) #これが必要
                  .where(members: { company_password: current_member.company_password })
                  .order(created_at: :desc)
                  .page(params[:page])
                  .per(6)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :place, :tag_id, :level_status,:open_status )
  end

end
