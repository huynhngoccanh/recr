class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.string :first_name
      t.string :last_name

      t.integer :role, default: 0
      t.string :role_name
      t.text :bio
      t.string :avatar

      t.integer :position, default: 0

      t.timestamps
    end
  end
end
