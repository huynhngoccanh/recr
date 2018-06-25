class Gen

  def self.do_it_all!(count=20)
    count = count.to_i
    ActiveRecord::Base.transaction do
      high_schools = count.times.map { high_school }
      athletes = Athlete.all.order('created_at DESC').first(count * 3)
      count.times { college }
      connect_everyone!(athletes)
      athletes.each { |athlete| add_tons_of_stats!(athlete) }

      true
    end
  end

  ## USERS

  def self.user(profile)
    email = "#{profile.first_name}_#{profile.last_name}@example.com"
    user = User.new(email: email,
                    profile: profile,
                    role: 1,
                    password: "password",
                    password_confirmation: "password",
                    completed_registration_at: DateTime.now
                   )
    user.save
    user
  end

  ## INDIVIDUAL PROFILES

  def self.athlete
    attributes = {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      class_of: [2016, 2017, 2018, 2019].sample,
      primary_position: Position.abbreviations.sample,
      height: (rand(56) + 56),
      weight: (rand(300) + 100),
      jersey_number: (1 + rand(99))
    }

    athlete = Athlete.create(attributes)
    highlight(athlete)

    athlete_user = user(athlete)
    athlete
  end

  def self.coach
    attributes = {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      role_name: "Coach",
      bio: Faker::Hipster.sentences(3).join,
      role: 0
    }

    coach = Coach.create(attributes)
    coach_user = user(coach)
    coach
  end

  ## ORGANIZATIONS

  def self.high_school
    high_school = HighSchool.create(
      name: "#{Faker::StarWars.planet} High School",
      enrollment: rand(5000) + 1,
      team_record: "#{rand(8)}-#{rand(8)}",
      mascot: Faker::Team.creature,
      offensive_schema: Faker::Hipster.sentences(3).join,
      defensive_schema: Faker::Hipster.sentences(3).join,
      school_email: Faker::Internet.email,
      address: address
    )
    affiliate(coach, high_school)
    affiliate(coach, high_school)
    affiliate(coach, high_school)

    enroll(athlete, high_school)
    enroll(athlete, high_school)
    enroll(athlete, high_school)

    highlight(high_school)
    high_school
  end

  def self.college
    new_college = College.create(
      name: "#{Faker::Superhero.power} University",
      division: [2, 3].sample,
      enrollment: rand(5000) + 1,
      team_record: "#{rand(8)}-#{rand(8)}",
      mascot: Faker::Team.creature,
      offensive_schema: Faker::Hipster.sentences(3).join,
      defensive_schema: Faker::Hipster.sentences(3).join,
      school_email: Faker::Internet.email,
      address: address
    )

    affiliate(coach, new_college)
    affiliate(coach, new_college)
    affiliate(coach, new_college)
    highlight(new_college)

    new_college
  end


  ## INDIVIDUALS <-> ORGANIZATIONS

  def self.affiliate(coach, high_school)
    affiliation = Affiliation.create(coach: coach, organization: high_school, organization_approved: true)
    affiliation
  end

  def self.enroll(athlete, high_school)
    enrollment = Enrollment.create(athlete: athlete, high_school: high_school, high_school_approved: true)
  end

  def self.connect_everyone!(athletes)
    athletes.each do |athlete|
      colleges = College.all.to_a.shuffle

      all_connection_states.each do |state|
        college = colleges.pop
        Connection.create(athlete: athlete, college: college, athlete_approved: state[0], college_approved: state[1])
      end
    end
    approved_connections = Connection.all.fully_approved.limit(Connection.all.fully_approved.count / 2)
    approved_connections.each do |connection|
      connection.update(committed: [true, false].sample, letter_of_intent_signed: [true, false].sample)
    end
  end

  ## SINGULAR MODELS

  def self.address
    Address.new(
      line1: Faker::Address.street_name,
      state: Faker::Address.state_abbr,
      city: Faker::Address.city,
      zip: Faker::Address.zip
    )
  end

  def self.highlight(highlightable)
    Highlight.create(
      title: Faker::Team.name,
      description: Faker::Hipster.sentences(3).join(" "),
      raw_url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      highlightable: highlightable,
      tagged_positions: Position.abbreviations.sample(2).to_a
    )
  end

  ## OTHER

  def self.all_connection_states
    combinations = [true, false, nil].combination(2).to_a
    combinations.push([true, true]).push([false, false]).push([nil, nil])
    combinations
  end

  def self.add_tons_of_stats!(athlete)
    primary_position = Position.abbreviations.sample
    athlete.update(primary_position: primary_position)
    positions = [primary_position, Position.abbreviations.sample, Position.abbreviations.sample]
    positions.each do |abbreviation|
      position_helper = Athlete::PositionHelper.new(abbreviation)

      athlete.potential_seasons.each do |season|
        position = position_helper.class_name.new(season: season)
        position.stat_attributes.each do |stat|
          position.send("#{stat}=", rand(200))
        end
        Stat.create(athlete: athlete, position: position)
      end
    end
  end
end
