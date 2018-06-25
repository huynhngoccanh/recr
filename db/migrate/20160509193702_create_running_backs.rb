class CreateRunningBacks < ActiveRecord::Migration[5.0]
  def change
    create_table :running_backs do |t|
      t.integer :season
      t.integer :rushing_yards
      t.integer :rushing_touchdowns
      t.integer :receiving_yards
      t.integer :receiving_touchdowns

      t.timestamps
    end
  end
end
