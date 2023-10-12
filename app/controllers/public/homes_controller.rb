class Public::HomesController < ApplicationController
  def top
    @public_posts = Post.where(open_status: [2])
                    .order(created_at: :desc)
                    .page(params[:page])
                    .per(6)
    # 受け取ったストリングパラメーターが存在すればfalse、存在しなけばtrueをインスタンス変数に格納
    @display = !params[:title_link]
  end

  def about
  end
end
