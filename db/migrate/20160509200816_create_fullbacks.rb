class CreateFullbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :fullbacks do |t|
      t.integer :season
      t.integer :receiving_yards
      t.integer :receiving_touchdowns
      t.integer :rushing_yards
      t.integer :rushing_touchdowns
      t.integer :pancakes

      t.timestamps
    end
  end
end
