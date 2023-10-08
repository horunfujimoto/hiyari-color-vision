class Public::MembersController < ApplicationController


  def show
    @member = Member.find(params[:id])
    @member_posts = Post.where(member_id: @member, open_status: [0, 2])
                      .order(created_at: "DESC")
                      .page(params[:page])
    # @favorite_posts = Vision.includes(:post, :favorites)
    #                   .where('favorites.member_id': @member.id)
    #                   .order('favorites.created_at DESC')
    #                   .page(params[:page])
    @unopened_posts = Post.where(member_id: @member, open_status: 1)
                      .order(created_at: "DESC")
                      .page(params[:page])
  end

  def edit
    @member = current_member
  end

  def update
    member = current_member
    if member.update(member_params)
      flash[:notice] = "プロフィールの編集が完了しました。"
      redirect_to members_path
    else
      flash[:notice] = "編集内容に不備があります。"
      redirect_to request.referer
    end
  end

  def withdraw
    @member = Member.find(params[:id])
    # is_activeカラムを2に変更することにより削除フラグを立てる
    @member.update(is_active: 2)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end

  def member_params
    params.require(:member).permit(:email, :name, :company_password, :industry, :company, :is_active )
  end

end
