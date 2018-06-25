class AddGpaToAthletes < ActiveRecord::Migration[5.0]
  def change
    add_column :athletes, :gpa, :decimal, precision: 3, scale: 2
    add_column :athletes, :display_gpa, :boolean
  end
end
