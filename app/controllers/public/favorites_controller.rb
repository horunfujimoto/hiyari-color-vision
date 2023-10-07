class Public::FavoritesController < ApplicationController

  def create
    @vision = Vision.find(params[:vision_id])
    favorite = @vision.favorites.new(member_id: current_member.id)
    favorite.save
  end

  def destroy
    @vision = Vision.find(params[:vision_id])
    favorite = current_member.favorites.find_by(vision_id: @vision.id)
    favorite.destroy
  end

end
