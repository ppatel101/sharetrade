class NoticesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @notify_users = Notice.all
  end

  def show 
    @notify_user = Notice.find(params[:id])
    # @notify_user.update(status: "read")
  end
end
