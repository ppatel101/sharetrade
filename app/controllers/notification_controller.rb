class NotificationController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @notify_users = current_user.notify_users.order_by_status
  end

  def show 
    @notify_user = NotifyUser.find(params[:id])
    @notify_user.update(status: "read")
  end
end
