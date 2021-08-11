class AddColumnToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :name, :string
    add_reference :admins, :organization, null: true, foreign_key: true
  end
end
