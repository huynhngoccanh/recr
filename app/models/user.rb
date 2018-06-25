class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  enum role: {undetermined: 0, profiled: 1, admin: 2}

  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy
  has_many :messages
  belongs_to :profile, polymorphic: true, required: false

  delegate :first_name, :last_name, :name, to: :profile, allow_nil: true

  after_destroy :cleanup_messages

  acts_as_voter

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.info.email.present?
        user.email = auth.info.email
      else
        user.email = auth.uid + "@fb.com"
      end
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]

      athlete = Athlete.create(
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        remote_avatar_url: auth.info.image,
        class_of: 2000,
        jersey_number: 0,
        primary_position: Position.abbreviations.first,
        phone_number_attributes: { digits: auth.extra.raw_info.phone }
      )

      user.profile = athlete
      user.save!
    end
  end

  def connectable
    return profile.school if coach?
    return profile if athlete?
  end

  def conversable
    connectable
  end

  def high_school_coach?
    profile.is_a?(Coach) && profile.school.is_a?(HighSchool)
  end

  def college_coach?
    profile.is_a?(Coach) && profile.school.is_a?(College)
  end

  def coach?
    college_coach? || high_school_coach?
  end

  def athlete?
    profile.present? && profile.is_a?(Athlete)
  end

  def is_online?
    last_online_at.present? && last_online_at >= 30.minutes.ago
  end

  def messageable_users
    users = []
    users.push(User.all.to_a) if admin?
    users.push(membershipable.messageable_users) if membershipable
    users.flatten.uniq
    users = users - [self]
    users.flatten
  end

  def can_message?(user)
    messageable_users.include?(user)
  end

  def completed_registration?
   completed_registration_at.present?
  end

  def complete_registration!
    unless completed_registration?
      update(completed_registration_at: DateTime.now)
    end
  end

  def valid_athlete_profile?
    profile.present && profile.is_a?(Athlete) && profile.valid?
  end

  def enrolled_in_high_school?
    profile.high_school.present?
  end

  def reply_to_conversation(conversation, message)
    conversation.messages.create(body: message, user: self)
  end

  private

    def cleanup_messages
      if athlete?
        messages.destroy_all
      elsif coach?
        messages.each do |msg|
          msg.update(display_name: name, user_id: nil)
        end
      end
    end
end
