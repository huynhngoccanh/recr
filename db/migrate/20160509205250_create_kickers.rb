class CreateKickers < ActiveRecord::Migration[5.0]
  def change
    create_table :kickers do |t|
      t.integer :season
      t.integer :kicks_attempted
      t.integer :kicks_made
      t.integer :longest_kick
      t.integer :touchbacks
      t.integer :yards_per_attempt

      t.timestamps
    end
  end
end
