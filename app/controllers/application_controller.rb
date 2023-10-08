class ApplicationController < ActionController::Base

  before_action :search_tag
  before_action :search_post

  protected

  def search_post
    @keyword = params[:keyword]
  end

  def search_tag
    @tags = Tag.all
  end

end
