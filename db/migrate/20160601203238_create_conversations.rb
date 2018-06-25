class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.references :organization, polymorphic: true
      t.references :athlete, foreign_key: true

      t.timestamps
    end
  end
end
