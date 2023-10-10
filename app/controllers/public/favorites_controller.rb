class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!

  def create
    @post = Post.find(params[:post_id])
    @vision = Vision.find(params[:vision_id])
    favorite = @vision.favorites.new(member_id: current_member.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @vision = Vision.find(params[:vision_id])
    favorite = current_member.favorites.find_by(vision_id: @vision.id)
    favorite.destroy
  end

end
