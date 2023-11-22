class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!
  before_action :get_post_id, only: [:create, :destroy]
  before_action :get_vision_id, only: [:create, :destroy]

  def create
    # 既にいいねが存在する場合は処理をスキップ
    unless already_favorited?
      favorite = @vision.favorites.new(member_id: current_member.id)
      favorite.save
    end
    # 必要に応じてリダイレクト先を変更するなどの処理を追加
  end

  def destroy
    # いいねが存在する場合のみ削除
    if already_favorited?
      favorite = current_member.favorites.find_by(vision_id: @vision.id)
      favorite.destroy
    end
    # 必要に応じてリダイレクト先を変更するなどの処理を追加
  end

  private

  def get_post_id
    @post = Post.find(params[:post_id])
  end

  def get_vision_id
    @vision = Vision.find(params[:vision_id])
  end

  def already_favorited?
    # すでにいいねが存在するか確認
    current_member.favorites.exists?(vision_id: @vision.id)
  end
end
