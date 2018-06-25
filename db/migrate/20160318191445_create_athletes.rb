class CreateAthletes < ActiveRecord::Migration[5.0]
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name

      t.integer :height
      t.integer :weight
      t.string :avatar
      t.string :primary_position
      t.integer :jersey_number
      t.integer :bench_press
      t.integer :deadlift
      t.integer :squat
      t.float :forty_yard_dash
      t.float :hundred_yard_dash
      t.text :inspirational_quote
      t.integer :class_of

      t.timestamps
    end
  end
end
