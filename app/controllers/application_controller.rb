class ApplicationController < ActionController::Base
  before_action :notice, if: :member_signed_in?
  before_action :search_tag
  before_action :search_post

  protected

  def search_post
    @keyword = params[:keyword]
  end

  def search_tag
    @tags = Tag.all
  end

  #通知機能
  def notice
    @notices = current_member.passive_notifications
    @unchecked_notices = @notices.where(checked: false)
  end

end
