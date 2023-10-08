class Admin::MembersController < ApplicationController

  def index
    @member = Member.order(created_at: :desc).page(params[:page]).per(10)
  end

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

  def update
    @member = current_member
    if @member.update(member_params)
      flash[:notice] = "プロフィールの編集が完了しました。"
      redirect_to admin_member_path(@member)
    else
      flash[:notice] = "編集内容に不備があります。"
      redirect_to request.referer
    end
  end

  def member_params
    params.require(:member).permit(:email, :name, :company_password, :industry, :company, :is_active )
  end

end
