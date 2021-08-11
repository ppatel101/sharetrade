class AddOrganizationToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :daily_updates, :organization, null: true, foreign_key: true
    add_reference :notifications, :organization, null: true, foreign_key: true
  end
end
