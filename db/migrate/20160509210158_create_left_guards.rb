class CreateLeftGuards < ActiveRecord::Migration[5.0]
  def change
    create_table :left_guards do |t|
      t.integer :season
      t.integer :pancakes
      t.integer :sacks_allowed

      t.timestamps
    end
  end
end
