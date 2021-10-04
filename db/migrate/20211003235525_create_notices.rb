class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.string :title
      t.text :description
      t.references :admin, null: false, foreign_key: true
      t.timestamps
    end
  end
end
