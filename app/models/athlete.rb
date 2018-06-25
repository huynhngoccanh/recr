class Athlete < ApplicationRecord
  include Picturable

  has_one :user, as: :profile
  accepts_nested_attributes_for :user

  has_one :enrollment, dependent: :destroy
  has_one :high_school, through: :enrollment

  has_one :phone_number, as: :owner
  has_one :address, as: :owner

  has_many :connections, dependent: :destroy
  has_many :approved_connections, -> { where(college_approved: true) }, class_name: "Connection"

  has_many :articles, dependent: :destroy
  has_many :highlights, as: :highlightable, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :colleges, through: :connections
  has_many :stats, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :messages, through: :conversations

  has_one :phone_number, as: :owner
  has_one :address, as: :owner

  accepts_nested_attributes_for :phone_number, :address, allow_destroy: true

  validates_inclusion_of :class_of, in: (1980..3000)
  validates_inclusion_of :jersey_number, in: (0..99)
  validates_associated :highlights
  validates_presence_of :class_of, :first_name, :last_name

  delegate :email, to: :user

  CONNECTIONS_PER_WEEK = 3

  mount_uploader :avatar, AvatarUploader

  Position.full_position_names.each do |position|
    self.send(:has_many,                                    # => dynamically calling has_many with position names so we can change things easier
              "#{position.to_s.underscore}_stats".to_sym,   # => position name Quarterback will produce association quarterback_stats
              -> { order(season: :asc)},                    # => ordered by season with lowest year first
              through: :stats,                              # => look at stats table
              source: :position,                            # => since stat->position is polymorphic, we want it to look at :position_type column on stats table
              source_type: "Position::#{position.to_s}"     # => with a :position_type of Position::Quarterback
              )
  end

  if !!Rails.application.secrets.reduced_searchkick_usage
    searchkick word_start: [:name], settings: {number_of_shards: 1, number_of_replicas: 0}
  else
    searchkick word_start: [:name]
  end

  scope :connections_between, -> (athlete, from, to) { athlete.connections.where(created_at: from..to)}

  def search_data
    {
      name: name,
      updated_at: updated_at,
      primary_position: primary_position,
      positions: position_abbreviations,
      state: state,
      gpa: gpa,
      class_of: class_of
    }
  end

  def name
    "#{first_name} #{last_name}"
  end

  def connections_this_week
    Athlete.connections_between(self, DateTime.now.at_beginning_of_week, DateTime.now.at_end_of_week)
  end

  def connections_made_this_week_count
    connections_this_week.count
  end

  def connections_remaining_this_week_count
    CONNECTIONS_PER_WEEK - connections_made_this_week_count
  end

  def can_create_more_connections_this_week?
    connections_remaining_this_week_count > 0
  end

  def state
    high_school&.state
  end

  def city
    high_school&.city
  end

  def self.max_positions
    3
  end

  def conversable
    self
  end

  def school
    high_school
  end

  def messageable_users
    users = []
    if seniority != "freshman"
      connections.fully_approved.colleges.each do |connection|
        users.push(connection.college.coach_users)
      end
    end
    if high_school
      users.push high_school.coach_users
    end
    users.map(&:to_a).flatten.uniq
  end

  def seniority
    graduated  = DateTime.new(class_of, 5)
    senior     = DateTime.new((class_of - 1), 8)
    junior     = DateTime.new((class_of - 2), 8)
    sophomore  = DateTime.new((class_of - 3), 8)
    freshman   = DateTime.new((class_of - 4), 8)

    now = DateTime.now

    case
    when now > graduated      then "graduate"
    when now > senior         then "senior"
    when now > junior         then "junior"
    when now > sophomore      then "sophomore"
    when now > freshman       then "freshman"
    else
      "freshman"
    end
  end

  def positions
    unless stats.any?
      return []
    end
    positions = []
    stats.pluck(:position_type).uniq.each do |position|
      positions << Athlete::PositionHelper.new(position, self)
    end
    primary_pos = positions.find_index { |pos| pos.abbreviation == primary_position }
    if primary_pos
      positions.rotate!(primary_pos)
    end
    positions
  end

  def position_abbreviations
    if positions.any?
      positions.map &:abbreviation
    else
      nil
    end
  end

  def position(name)
    Athlete::PositionHelper.new(name, self)
  end

  def potential_seasons
    (0..3).map { |n| class_of - n }
  end

  def stat_board(state, position=nil, season=nil)
    @sb = StatBoard.new(state, self, position, season)
    @sb.result
  end

  def has_contact_info?
    !(address.nil? || !phone_number.nil?)
  end

  # This should probably be moved somewhere else since its only used for creation,
  # but need to figure out what athletes#edit and position ordering will operate like.

  validate :valid_primary_position

  def valid_primary_position
    errors.add(:base, "Must include a valid position abbreviation.") unless Position.abbreviations.include?(primary_position)
  end

  def has_contact_info?
    !!address && !!phone_number
  end
end
