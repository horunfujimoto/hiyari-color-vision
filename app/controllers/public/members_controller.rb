class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :get_current_member, only: [:edit, :update, :destroy]

  def show
    @member = Member.find(params[:id])
    @favorite_posts = Vision.includes(:post, :favorites)
                      .where('favorites.member_id': @member.id)
                      .order('favorites.created_at DESC')
    # Vision モデルから Post モデルの情報を取得!これがないとvision内にpostのカラムがないとエラーが出る
    @favorite_posts = @favorite_posts.map(&:post)
    @member_posts = Post.where(member_id: @member, open_status: [0, 2])
                      .order(created_at: "DESC")
    @unopened_posts = Post.where(member_id: @member, open_status: 1)
                      .order(created_at: "DESC")
  end

  def edit
  end

  def update
    if @member.update(member_params)
      flash[:notice] = "プロフィールの編集が完了しました。"
      redirect_to member_path
    else
      render :edit
    end
  end

  def destroy
    @member.update(is_active: :inactive)
    sign_out(@member)
    flash[:notice] = "退会しました。ご利用いただきありがとうございました。"
    redirect_to root_url
  end

  def confirm; end

  private

  def member_params
    params.require(:member).permit(:email, :name, :company_password, :industry, :company, :is_active )
  end

  def get_current_member
    @member = current_member
  end

  def ensure_guest_member
    @member = Member.find(params[:id])
    if @member.guest_member? redirect_to member_path(current_member) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
