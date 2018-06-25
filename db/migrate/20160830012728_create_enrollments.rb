class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.references :athlete, foreign_key: true
      t.references :high_school, foreign_key: true
      t.boolean :high_school_approved

      t.timestamps
    end
  end
end
