class CreatePhoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_numbers do |t|
      t.string :digits
      t.references :owner, polymorphic: true
      t.string :info

      t.timestamps
    end
  end
end
