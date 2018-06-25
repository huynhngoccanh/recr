class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.references :athlete, foreign_key: true
      t.string :relationship
      t.string :name
      t.string :contact_method
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
