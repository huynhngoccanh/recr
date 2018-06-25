class Article < ApplicationRecord
  belongs_to :athlete
  validates_presence_of :title, :description, :raw_url, :athlete_id
end
