class AddGpaRequirementToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :gpa_requirement, :decimal, precision: 3, scale: 2
  end
end
