class Public::TagsController < ApplicationController
  before_action :authenticate_member!

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.all
  end

end
