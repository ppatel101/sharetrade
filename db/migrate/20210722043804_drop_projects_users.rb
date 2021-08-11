class DropProjectsUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :projects_users
  end
end
