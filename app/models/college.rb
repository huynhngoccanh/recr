class College < ApplicationRecord
  include Picturable
  include Coachable
  include Addressable

  has_many :connections, dependent: :destroy
  has_many :athletes, through: :connections
  has_many :approved_athletes, source: :athlete, through: :connections

  has_many :conversations, as: :organization
  has_many :highlights, as: :highlightable, dependent: :destroy
  has_many :phone_numbers, as: :owner

  validates_presence_of :name, :division, :enrollment, :mascot, :school_email
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true, reject_if: :all_blank

  validates :division, inclusion: { in: [2, 3], message: "%{value} is not a valid division" }

  mount_uploader :logo, LogoUploader

  attr_accessor :finish_onboarding, :logo_cache, :remove_logo

  if !!Rails.application.secrets.reduced_searchkick_usage
    searchkick word_start: [:name], settings: {number_of_shards: 1, number_of_replicas: 0}
  else
    searchkick word_start: [:name]
  end

  def search_data
    {
      name: name,
      updated_at: updated_at,
      state: state,
      division: division
    }
  end

  def messageable_users
    coach_users
  end

  def approved_non_freshman_athletes
    athletes = connections.fully_approved.map(&:athlete)
    athletes.delete_if {|athlete| athlete.seniority == "freshman" }
    athletes
  end

  def allow_connections?
    allow_connections
  end
end
