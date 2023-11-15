class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reports = Report.order("created_at DESC").page(params[:page])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      flash[:notice] = "通報されたコメントの確認状況を更新しました。"
      redirect_to admin_post_path(@report.comment.post)
    else
      flash.now[:notice] = "確認状況を更新できませんでした。"
      render 'public/posts/show'
    end
  end

  def report_params
    params.require(:report).permit(:checked)
  end

end
