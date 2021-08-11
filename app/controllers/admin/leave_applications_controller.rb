class Admin::LeaveApplicationsController < AdminController
  before_action :find_leave, only: [:approve, :reject]
  before_action :get_users, only: [:index]

  def index
    @statuses = LeaveApplication.statuses.keys
    if params[:status].present? && params[:user_id].present? 
      @leaves = current_admin.leave_applications.where(status: params[:status], user_id: params[:user_id] ).all.order("created_at DESC").page(params[:page]).per(2)
    elsif params[:user_id].present?
      @leaves = current_admin.leave_applications.where(user_id: params[:user_id] ).all.order("created_at DESC").page(params[:page]).per(2)
    elsif params[:status].present?
      @leaves = current_admin.leave_applications.where(status: params[:status]).all.order("created_at DESC").page(params[:page]).per(2)
    else
      @leaves = current_admin.leave_applications.all.order("created_at DESC").page(params[:page]).per(2)
    end
  end

  def approve
    respond_to do |format|
      if @leave.update(status: "approved" )
        format.html { redirect_to admin_leave_applications_path, notice: 'Leaves was successfully approved'}
      else
        format.html { redirect_to admin_leave_applications_path, notice: 'Something went wrong'}
      end
    end
  end

  def reject
    respond_to do |format|
      if @leave.update(status: "rejected" )
        format.html { redirect_to admin_leave_applications_path, notice: 'Leaves was successfully rejected'}
      else
        format.html { redirect_to admin_leave_applications_path, notice: 'Something went wrong'}
      end
    end
  end

  private

  def find_leave
    @leave = LeaveApplication.find(params[:id])
  end

  def get_users
    if current_admin.organization
      @users_array = current_admin.users.all.map {|c| [c.name, c.id]}
    else
      @users_array = []
    end
  end

end