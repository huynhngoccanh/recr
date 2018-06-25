class CreateQuarterbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :quarterbacks do |t|
      t.integer :season
      t.integer :passing_yards
      t.integer :passing_touchdowns
      t.integer :rushing_yards
      t.integer :rushing_touchdowns

      t.timestamps
    end
  end
end
