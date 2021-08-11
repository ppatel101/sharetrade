class CreateLeaveApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_applications do |t|
      t.string :subject
      t.text :description

      t.timestamps
    end
  end
end
