class AddUserToLeaveApplication < ActiveRecord::Migration[6.0]
  def change
    add_reference :leave_applications, :user, null: false, foreign_key: true
  end
end
