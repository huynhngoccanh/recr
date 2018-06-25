class AddAllowConnectionsOptionToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :allow_connections, :boolean, default: true
  end
end
