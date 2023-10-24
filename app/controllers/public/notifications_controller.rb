class Public::NotificationsController < ApplicationController
  before_action :authenticate_member!

  def destroy
    Notification.find(params[:id]).destroy
    set_notifications
  end

  def destroy_all
    current_member.passive_notifications.destroy_all
    redirect_to root_path
  end

  def notice
    set_notifications
    @unchecked_notices.each { |notice| notice.update(checked: true) }
  end

end
