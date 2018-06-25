class HighSchool < ApplicationRecord
  include Coachable
  include Addressable

  has_many :enrollments, dependent: :destroy
  has_many :athletes, through: :enrollments
  has_many :athlete_users, through: :athletes, source: :user
  has_many :approved_enrollments, -> { approved }, class_name: 'Enrollment'
  has_many :approved_athletes, source: :athlete, through: :approved_enrollments

  has_many :connections, through: :approved_athletes
  has_many :approved_connections, -> { where(college_approved: true) }, through: :approved_athletes
  has_many :recruited_athletes, through: :approved_connections, source: :athlete

  has_many :highlights, as: :highlightable, dependent: :destroy
  has_many :conversations, as: :organization

  has_many :phone_numbers, as: :owner
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :name, :enrollment, :mascot, :school_email

  if !!Rails.application.secrets.reduced_searchkick_usage
    searchkick word_start: [:name], settings: {number_of_shards: 1, number_of_replicas: 0}
  else
    searchkick word_start: [:name]
  end

  mount_uploader :logo, LogoUploader

  ENROLLMENT_SEARCH_BOUNDS = [100, 250, 500, 800, 1200, 1500, 2000, 5000]

  def self.enrollment_interval_options
    results = ENROLLMENT_SEARCH_BOUNDS.map do |num|
      ["<#{num}", num]
    end
    results.push(["#{ENROLLMENT_SEARCH_BOUNDS.last}+", 1000000])
    results
  end

  def invited_users
    athlete_users.where.not(invitation_created_at: nil)
  end

  def transcript_requests_enabled?
    if counselor_name.present? && counselor_email.present?
      return true
    else
      false
    end
  end

  def search_data
    {
      name: name.downcase,
      updated_at: updated_at,
      state: state,
      enrollment: enrollment
    }
  end

  def roster
    approved_athletes.order(jersey_number: :asc)
  end

  def messageable_users
    coach_users
  end

  def added_by
    if added_by_id
      User.find(added_by_id)
    else
      "nobody"
    end
  end
end
