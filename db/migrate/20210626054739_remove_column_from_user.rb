class RemoveColumnFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :personal_email, :string
  end
end
