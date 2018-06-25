class CreateTackles < ActiveRecord::Migration[5.0]
  def change
    create_table :tackles do |t|
      t.integer :season
      t.integer :pancakes
      t.integer :sacks_allowed

      t.timestamps
    end
  end
end
