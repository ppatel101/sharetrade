class AddColumnToLeaveApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :leave_applications, :to_time, :datetime
    add_column :leave_applications, :from_time, :datetime
    add_column :leave_applications, :half_day, :boolean,default: false
  end
end
