class Admin::NotificationsController < AdminController
  before_action :find_notification, except: [:index, :new, :create]
  
  def index
    if current_admin.organization
      @notifications = current_admin.notifications
    else
      @notifications = []
    end
  end

  def new
    @notification = Notification.new
    @users = current_admin.users
  end
  
  def show
    respond_to do |format|
      format.html { render 'show'}
      format.js
    end
  end

  def create
    if current_admin.organization
      @notification = current_admin.organization.notifications.new(notification_params)
    else
      @notification = Notification.new(notification_params)
    end
    respond_to do |format|
      if @notification.save
        format.html { redirect_to admin_notifications_path, notice: 'Notification was successfully created.' }
      else
        format.html { render 'new'}
        format.json { render json: @notification.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to admin_notifications_path, notice: 'Notification was successfully updated.' }
      else
        render :edit
      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to admin_notifications_path, notice: 'Notification was successfully destroyed.' }
    end
  end

  private
  def notification_params
    params.require(:notification).permit(:title, :description, :organization_id)
  end

  def find_notification
    @notification = Notification.find(params[:id])
  end

end
