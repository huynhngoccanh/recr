class AddDisplayNameAndRemoveForeignKeyConstraintFromMessages < ActiveRecord::Migration[5.0]
  def up
    add_column :messages, :display_name, :string
    remove_foreign_key "messages", "users"
  end

  def down
    remove_column :messages, :display_name, :string
    add_foreign_key "messages", "users"
  end
end
