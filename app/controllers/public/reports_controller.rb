class Public::ReportsController < ApplicationController
  before_action :authenticate_member!

  def create
    @report = Report.new(report_params)
    @comment = @report.comment
    @post = @comment.post
    @member = @post.member
    @report.post_id = @post.id
    if @report.save
      flash[:notice] = "通報が送信されました。"
      redirect_to post_path(@post)
    else
      flash.now[:notice] = "通報できませんでした。項目を選択してください。"
      render 'public/posts/show'
    end
  end

  private

  def report_params
    params.require(:report).permit(:member_id, :comment_id, :post_id, :reason)
  end

end
