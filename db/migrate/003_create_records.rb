class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :game, null: false, foreign_key: true, index: true
      t.integer :points_won, null: false, default: 0
      t.integer :points_lost, null: false, default: 0

      t.timestamps null: false
    end
  end
end
