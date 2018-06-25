class CreatePunters < ActiveRecord::Migration[5.0]
  def change
    create_table :punters do |t|
      t.integer :season
      t.integer :punts
      t.integer :yards_per_attempt
      t.integer :longest_punt

      t.timestamps
    end
  end
end
