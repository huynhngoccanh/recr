class AddLastOnlineAtToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_online_at, :datetime
  end
end
