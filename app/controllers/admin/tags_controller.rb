class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_tag_id, only: [:edit, :update, :destroy]

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "新しいタグを作成しました。"
      redirect_to admin_tags_path
    else
      @tags = Tag.all
      render :index
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      flash[:notice] = "情報を更新しました。"
      redirect_to admin_tags_path
    else
      render :edit
    end
  end

  def destroy
   @tag.destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def get_tag_id
    @tag = Tag.find(params[:id])
  end
end
