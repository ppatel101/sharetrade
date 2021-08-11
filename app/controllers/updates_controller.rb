class UpdatesController < ApplicationController
  include UpdateHelper
  before_action :authenticate_user!
  before_action :find_update, only: [:edit, :update]

  def index
    distinct_year_month(current_user.id)
    daily_update_record(params['updates_select_by_month_year'], current_user)
  end

  def new
    @update = DailyUpdate.new
  end

  def create
    @update = current_user.organization.daily_updates.new(update_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @update.save
        format.html { redirect_to updates_path, notice: 'Daily Update was successfully created.' }
      else
        format.html { render 'new'}
        format.json { render json: @update.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    if current_user.id == @daily_update.user_id
      respond_to do |format|
        if @daily_update.update(update_params)
          format.html { redirect_to updates_path, notice: 'Daily Update was successfully updated.' }
        else
          format.html { render 'edit'}
        end
      end
    else
      redirect_to updates_path
    end
  end

  private
  def update_params
    params.require(:daily_update).permit(:description, :in_time, :out_time)
  end

  def find_update
    @daily_update = DailyUpdate.find(params[:id])
  end
end
