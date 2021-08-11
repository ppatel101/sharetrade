class AddOrganizationReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :systems, :organization, null: false, foreign_key: true
    add_reference :users, :organization, null: false, foreign_key: true
    add_reference :leave_applications, :organization, null: false, foreign_key: true
  end
end
