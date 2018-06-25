class Enrollment < ApplicationRecord
  belongs_to :athlete
  belongs_to :high_school

  scope :approved, -> { where(high_school_approved: true) }
  scope :deciding, -> { where(high_school_approved: nil) }
  scope :rejected, -> { where(high_school_approved: false) }
  scope :pending_approval, -> { where(high_school_approved: false) }

  def self.exists?(args)
    high_school = args[:high_school]
    athlete = args[:athlete]

    return false unless athlete && high_school

    Enrollment.approved.where(athlete: athlete, high_school: high_school).any?
  end

  def status
     case high_school_approved
     when nil
       "deciding"
     when true
       "approved"
     when false
       "rejected"
     end
  end
end
