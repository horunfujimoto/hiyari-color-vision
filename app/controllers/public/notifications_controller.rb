class Public::NotificationsController < ApplicationController
  before_action :authenticate_member!

  def destroy
    Notification.find(params[:id]).destroy
    @notices = current_member.passive_notifications
    @notices = @notices.where.not(visiter_id: current_member.id)
  end

  def destroy_all
    current_member.passive_notifications.destroy_all
    redirect_to root_path
  end

  def notice
    @notices = current_member.passive_notifications
    @notices.where(checked: false).each do |notice|
      notice.update(checked: true)
    end
    @notices = @notices.where.not(visiter_id: current_member.id)
    @unchecked_notice = current_member.passive_notifications.where(checked: false)
  end

end
