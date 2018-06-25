class Profile
  attr_accessor :resource, :user, :action_name

  def initialize(resource, user, action_name)
    @resource = resource
    @user = user
    @action_name = action_name
    set_connection
  end

  def jumbotron_path
    "/profile/#{resource.class.to_s.underscore.pluralize}/jumbotron"
  end

  def navigation_path
    case action_name
    when "edit_index", "edit", "new"
      "/profile/#{resource.class.to_s.underscore.pluralize}/navigation/edit"
    else
      "/profile/#{resource.class.to_s.underscore.pluralize}/navigation/show"
    end
  end

  def set_connection
    return false unless @user

    case
    when (@user.profile.is_a?(Athlete) && @resource.is_a?(College))
      @connection = Connection.where(athlete: @user.profile, college: resource).first_or_initialize
      @connection.set_perspective(@user.profile) if @connection.persisted?
    when (@user.college_coach? && @resource.is_a?(Athlete))
      @connection = Connection.where(athlete: resource, college: @user.profile.school).first_or_initialize
      @connection.set_perspective(@user.profile.school) if @connection.persisted?
    end
  end

  def connection
    @connection
  end

  def belongs_to_current_user?
    return false unless user
    resource == user.membershipable
  end
end
