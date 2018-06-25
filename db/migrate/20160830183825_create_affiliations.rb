class CreateAffiliations < ActiveRecord::Migration[5.0]
  def change
    create_table :affiliations do |t|
      t.references :coach, foreign_key: true
      t.references :organization, polymorphic: true
      t.boolean :organization_approved

      t.timestamps
    end
  end
end
