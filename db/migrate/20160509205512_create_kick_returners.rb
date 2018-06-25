class CreateKickReturners < ActiveRecord::Migration[5.0]
  def change
    create_table :kick_returners do |t|
      t.integer :season
      t.integer :kick_return_yards
      t.integer :kick_return_touchdowns

      t.timestamps
    end
  end
end
