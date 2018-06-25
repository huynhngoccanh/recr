class AddHudlLinkToAthletes < ActiveRecord::Migration[5.0]
  def change
    add_column :athletes, :hudl_url, :string
  end
end
