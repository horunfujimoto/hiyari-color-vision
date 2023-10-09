class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @member = Member.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
    @favorite_posts = Vision.includes(:post, :favorites)
                      .where('favorites.member_id': @member.id)
                      .order('favorites.created_at DESC')
                      .page(params[:page])
    # Vision モデルから Post モデルの情報を取得!これがないとvision内にpostのカラムがないとエラーが出る
    @favorite_posts = @favorite_posts.map(&:post)
    @member_posts = Post.where(member_id: @member, open_status: [0, 2])
                      .order(created_at: "DESC")
                      .page(params[:page])
    @unopened_posts = Post.where(member_id: @member, open_status: 1)
                      .order(created_at: "DESC")
                      .page(params[:page])
  end

  def update
    @member = Member.find(params[:id]) # 更新対象の会員を取得
    if @member.update(member_params) # 会員のステータスを更新
      flash[:notice] = "会員のステータスを更新しました。"
      redirect_to admin_member_path(@member)
    else
      flash[:alert] = "ステータスの更新に失敗しました。"
      render :show
    end
  end

  def member_params
    params.require(:member).permit(:is_active )
  end

end
