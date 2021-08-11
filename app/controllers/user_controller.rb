class UserController < ApplicationController
  include UpdateHelper
  before_action :authenticate_user!
  
  def index
    distinct_year_month(current_user.id)
    daily_update_record(params['updates_select_by_month_year'], current_user)
  end

end
