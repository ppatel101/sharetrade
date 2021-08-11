class AddColumnToDailyUpdate < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_updates, :in_time, :datetime
    add_column :daily_updates, :out_time, :datetime
  end
end
