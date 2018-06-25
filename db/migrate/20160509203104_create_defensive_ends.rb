class CreateDefensiveEnds < ActiveRecord::Migration[5.0]
  def change
    create_table :defensive_ends do |t|
      t.integer :season
      t.integer :sacks
      t.integer :interceptions
      t.integer :forced_fumbles
      t.integer :tackles
      t.integer :pass_breakups
      t.integer :tackles_for_loss
      t.integer :defensive_touchdowns

      t.timestamps
    end
  end
end
