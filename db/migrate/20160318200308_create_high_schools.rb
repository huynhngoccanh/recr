class CreateHighSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :high_schools do |t|
      t.string   :name
      t.text     :logo
      t.integer  :added_by_id
      t.text     :offensive_schema
      t.text     :defensive_schema
      t.integer  :enrollment
      t.string   :team_record
      t.string   :mascot
      t.string   :school_email

      t.string   :registration_coach_name
      t.string   :registration_coach_phone_number

      t.timestamps
    end
  end
end
