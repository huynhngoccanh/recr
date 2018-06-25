class CreateWideReceivers < ActiveRecord::Migration[5.0]
  def change
    create_table :wide_receivers do |t|
      t.integer :season
      t.integer :receiving_yards
      t.integer :receiving_touchdowns
      t.integer :yards_after_catches
      t.integer :catches

      t.timestamps
    end
  end
end
