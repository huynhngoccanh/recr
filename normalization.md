normalization.md

phone_numbers
  digits (integer)
  owner_id
  owner_type
  info

PhoneNumber
  belongs_to :owner, polymorphic: true

Coach
	has_many :phone_numbers, as: :owner

College
  has_many :phone_numbers, as: :owner

High School
	has_many :phone_numbers, as: :owner

Reference
	has_many :phone_numbers, as: :owner

belongs_to has_one

If a phone_number belongs_to coach, the "Foreign key" will refer to the coach, and it will be on the phone_number

If a coach has_one phone_number, the "foreign key" will actually be on the coach, and it will refer to the phone_number

Coach
  has_one :phone_number #rails is gonna look for a phone_number_id on the coach
  has_many :phone_number #rails is gonna look for a coach_id in the phone_numbers table
  has_many :phone_numbers, as: :owner #rails is gonna look for owner_type = "Coach", owner_id = @coach.id on the phone_numbers table

  belongs_to # denotes the foreign key is on the current table that belongs_to

"Foreign Key", User.id = 3, then if you store user_id (3) in a column on a different table

High School

Reference

# Remove all the old phone_number columns, 

# Add the PhoneNumber table
# Create new phone_numbers based on existing columns
# Migration to remove old columns
# Run after verifying we didn't lose any #'s

# Remove old columns directly from the migrations
# Rebuild DB
# Add the phone_numbers table - check
# Wire up relations - check
# Wire up the views with cocoon