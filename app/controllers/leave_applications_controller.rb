class LeaveApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @leave_applications = current_user.leave_applications.order("created_at DESC")
  end

  def new
    @leave_application = LeaveApplication.new
  end

  def create
    @leave_application = current_user.organization.leave_applications.new(leave_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @leave_application.save
        format.html { redirect_to leave_applications_path, notice: 'Leave application was successfully created.' }
      else
        format.html { render 'new'}
        format.json { render json: @leave_application.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def leave_params
    params.require(:leave_application).permit(:subject, :description, :to_date, :half_day, :from_date, :to_time, :from_time, :organization_id)
  end
end
