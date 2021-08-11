class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :systems, :warrenty_month, :warranty_month
  end
end
