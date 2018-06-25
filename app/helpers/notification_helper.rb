module NotificationHelper

  def actor_profile_path(actor)
    return actor.profile if actor.athlete?
    return actor.profile.school if actor.coach?
    return "#" if actor.admin?
  end
end
