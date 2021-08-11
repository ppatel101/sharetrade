class ChangeDefaultToSyatem < ActiveRecord::Migration[6.0]
  def change
    change_column_null :systems, :user_id, true
  end
end
