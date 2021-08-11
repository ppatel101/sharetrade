class AddDateToLeaveApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :leave_applications, :from_date, :date
    add_column :leave_applications, :to_date, :date
  end
end
