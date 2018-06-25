class Conversation < ApplicationRecord
  belongs_to :organization, polymorphic: true
  belongs_to :athlete
  has_many :messages, dependent: :destroy

  accepts_nested_attributes_for :messages

  validates_associated :athlete, :organization

  after_create :send_contact_info_message

  def self.allowed?(user, athlete)
    return false unless user
    return false unless athlete
    return false if athlete.seniority == "freshman"
    return false unless user.college_coach?
    Connection.exists?(college: user.profile.school, athlete: athlete)
  end

  private

  def send_contact_info_message
    return true unless athlete.has_contact_info?

    messages.create(
      user: athlete.user,
      body: "Hello! This player has opted to automatically share their contact info with you."
    )
    messages.create(
      user: athlete.user,
      body: "Phone #: #{athlete.phone_number.digits}"
    )
    messages.create(
      user: athlete.user,
      body: "Address: #{athlete.address.complete_address}"
    )
  end
end
