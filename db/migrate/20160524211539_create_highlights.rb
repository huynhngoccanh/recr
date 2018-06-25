class CreateHighlights < ActiveRecord::Migration[5.0]
  def change
    create_table :highlights do |t|
      t.string :title
      t.string :description
      t.string :raw_url
      t.string :thumbnail_url
      t.text :tagged_positions, array: true, default: []
      t.references :highlightable, polymorphic: true

      t.timestamps
    end
  end
end
