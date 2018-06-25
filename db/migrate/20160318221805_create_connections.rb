class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.references :athlete, foreign_key: true
      t.references :college, foreign_key: true, index: true
      t.boolean :athlete_approved
      t.boolean :college_approved
      t.boolean :committed, default: false
      t.boolean :letter_of_intent_signed, default: false

      t.timestamps
    end
  end
end
