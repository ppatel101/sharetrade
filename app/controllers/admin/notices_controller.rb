class Admin::NoticesController < AdminController
  before_action :find_notification, except: [:index, :new, :create]
  
  def index
    if current_admin.notices
      @notifications = current_admin.notices
    else
      @notifications = []
    end
  end

  def new
    @notification = Notice.new
    # @users = current_admin.users
  end
  
  def show
    respond_to do |format|
      format.html { render 'show'}
      format.js
    end
  end

  def create
    @notification = Notice.new(notification_params)
    respond_to do |format|
      if @notification.save
        format.html { redirect_to admin_notices_path, notice: 'Notification was successfully created.' }
      else
        format.html { render 'new'}
        format.json { render json: @notification.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to admin_notices_path, notice: 'Notification was successfully updated.' }
      else
        render :edit
      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to admin_notices_path, notice: 'Notification was successfully destroyed.' }
    end
  end

  private
  def notification_params
    params.require(:notice).permit(:title, :description, :admin_id)
  end

  def find_notification
    @notification = Notice.find(params[:id])
  end
end
