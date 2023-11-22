class Public::PostsController < ApplicationController
  before_action :authenticate_member!
  before_action :get_post_id, only: [:show, :edit, :update, :destroy]
  before_action :check_post_owner, only: [:edit, :update, :destroy]

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
    # 公開もしくは全体公開のどちらかを選択した場合は表示される
    # current_member の company_password カラムと一致する投稿のみを取得
    @open_posts = @sort.where(open_status: [0, 2])
                  .joins(:member) #これが必要
                  .where(members: { company_password: current_member.company_password })
                  .page(params[:page])
                  .per(10)
  end

  def show
    @comment = Comment.new
    @member = @post.member
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
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "投稿情報を更新しました。"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :place, :tag_id, :level_status,:open_status,:occurrence_at )
  end

  def get_post_id
    @post = Post.find(params[:id])
  end

  def check_post_owner
    unless @post.member == current_member
      flash[:alert] = "アクセス権限がありません。"
      redirect_to root_path
    end
  end

end
