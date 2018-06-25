class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.float  :lat
      t.float :lng
      t.string :formatted_address
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end

  end
end
