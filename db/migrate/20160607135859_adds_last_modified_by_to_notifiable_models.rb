class AddsLastModifiedByToNotifiableModels < ActiveRecord::Migration[5.0]
  def change
    add_column :connections, :last_modified_by_id, :integer
    add_column :stats, :last_modified_by_id, :integer
  end
end
