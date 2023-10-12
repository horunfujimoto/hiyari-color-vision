class Public::HomesController < ApplicationController
  def top
    @public_posts = Post.where(open_status: [2])
                    .order(created_at: :desc)
                    .page(params[:page])
                    .per(10)
  end

  def about
  end
end
