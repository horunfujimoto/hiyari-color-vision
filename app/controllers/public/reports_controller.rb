class Public::ReportsController < ApplicationController
  before_action :authenticate_member!

  def new
    @report = Report.new
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
  end

  def create
    # 通報作成のアクション
    @report = current_member.reporter.build(report_params)
    @comment = @report.comment
    @post = @comment.post
    @member = @post.member
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
    params.require(:report).permit(:reported_id, :reporter_id, :comment_id, :reason)
  end

end
