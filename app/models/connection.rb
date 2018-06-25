class Connection < ApplicationRecord
  belongs_to :athlete
  belongs_to :college

  scope :committed, -> { where(committed: true).or(Connection.where(letter_of_intent_signed: true)) }
  scope :fully_approved, -> {where(athlete_approved: true)}
  validates_associated :athlete, :college
  validates :athlete_id, uniqueness: { scope: :college_id, message: "A connection already exists between this athlete and this college." }

  after_create :create_conversation
   
  def self.exists?(args)
    athlete = args[:athlete]
    user = args[:user]
    college = args[:college]

    return false unless athlete

    if user && user.college_coach?
      college = user.profile.school
    end

    return false unless college

    where(college: college, athlete: athlete).any?
  end

  def self.create_as_athlete(athlete, college, user)
    create(athlete: athlete, athlete_approved: true, college: college, last_modified_by_id: user.id)
  end

  def last_modified_by
    User.find(last_modified_by_id)
  end

  def create_conversation
    Conversation.where(athlete: self.athlete, organization: self.college).first_or_create
  end
  
  # def self.fully_approved
  #   true
  # end
end
