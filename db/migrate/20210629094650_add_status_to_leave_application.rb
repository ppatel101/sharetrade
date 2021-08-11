class AddStatusToLeaveApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :leave_applications, :status, :integer, default: 0
  end
end
