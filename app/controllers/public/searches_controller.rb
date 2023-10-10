class Public::SearchesController < ApplicationController
  before_action :authenticate_member!

  def index
    @posts = Post.search(params[:keyword]).page(params[:page]).per(24)
  end

end
