class CreateSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :systems do |t|
      t.string :name
      t.text :description
      t.date :purchase_date
      t.integer :warrenty_month
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
