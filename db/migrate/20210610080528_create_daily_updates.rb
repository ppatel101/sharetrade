class CreateDailyUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_updates do |t|
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
