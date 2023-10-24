class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!
  before_action :get_post_id, only: [:create, :destroy]
  before_action :get_vision_id, only: [:create, :destroy]

  def create
    favorite = @vision.favorites.new(member_id: current_member.id)
    favorite.save
  end

  def destroy
    favorite = current_member.favorites.find_by(vision_id: @vision.id)
    favorite.destroy
  end

  private

  def get_post_id
    @post = Post.find(params[:post_id])
  end

  def get_vision_id
    @vision = Vision.find(params[:vision_id])
  end

end
