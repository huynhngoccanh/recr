class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :raw_url
      t.references :athlete, foreign_key: true

      t.timestamps
    end
  end
end
