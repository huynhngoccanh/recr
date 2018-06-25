class Affiliation < ApplicationRecord
  belongs_to :coach
  belongs_to :organization, polymorphic: true
end
