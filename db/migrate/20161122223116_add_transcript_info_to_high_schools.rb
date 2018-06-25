class AddTranscriptInfoToHighSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :high_schools, :counselor_name, :string
    add_column :high_schools, :counselor_email, :string
    add_column :high_schools, :counselor_phone_number, :string
  end
end
