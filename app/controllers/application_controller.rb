class ApplicationController < ActionController::Base
  # ここに記述することで、他のコントローラーでも下記アクションを実施
  before_action :set_notifications, if: :member_signed_in?
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
  def set_notifications
    @notices = current_member.passive_notifications
    @notices = @notices.where.not(visiter_id: current_member.id)
    @unchecked_notices = @notices.where(checked: false)
  end

end
