class CreateStats < ActiveRecord::Migration[5.0]
  def change
    create_table :stats do |t|
      t.references :athlete, foreign_key: true
      t.references :position, polymorphic: true

      t.timestamps
    end
  end
end
