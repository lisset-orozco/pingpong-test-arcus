class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :player, null: false, foreign_key: { to_table: :users }, index: true
      t.references :opponent, null: false, foreign_key: { to_table: :users }, index: true
      t.float :player_score, null: false
      t.float :opponent_score, null: false
      t.datetime :played_at, null: false

      t.timestamps null: false
    end
  end
end
