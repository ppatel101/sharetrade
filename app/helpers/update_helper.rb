module UpdateHelper
  def distinct_year_month(id)
    if id.is_a? Integer
      results = ActiveRecord::Base.connection.execute("SELECT DISTINCT to_char(created_at,'YYYY-Month') as created_at from daily_updates where user_id = #{id}")
      @updates_select_by_month_year = results.map{|i|i["created_at"]}
    end
  end

  def daily_update_record(updates_select_by_month_year, user)
    if updates_select_by_month_year.present?
      @daily_updates = user.daily_updates.with_year_and_month(updates_select_by_month_year)
    else
      @daily_updates = user.daily_updates.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
    end
  end
end