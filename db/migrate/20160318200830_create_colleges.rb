class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.text :logo
      t.integer :added_by_id
      t.text :offensive_schema
      t.text :defensive_schema
      t.integer :division, null: false
      t.integer :enrollment
      t.string :team_record
      t.string :mascot
      t.string :school_email

      t.timestamps
    end
  end
end
