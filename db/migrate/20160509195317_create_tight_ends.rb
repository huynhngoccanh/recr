class CreateTightEnds < ActiveRecord::Migration[5.0]
  def change
    create_table :tight_ends do |t|
      t.integer :season
      t.integer :receiving_yards
      t.integer :catches
      t.integer :receiving_touchdowns

      t.timestamps
    end
  end
end
