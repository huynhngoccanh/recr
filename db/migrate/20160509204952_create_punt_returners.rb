class CreatePuntReturners < ActiveRecord::Migration[5.0]
  def change
    create_table :punt_returners do |t|
      t.integer :season
      t.integer :punt_return_yards
      t.integer :punt_return_touchdowns

      t.timestamps
    end
  end
end
