module ApplicationHelper
  def display_name(user)
    if user.profiled?
      user.profile.name
    else
      user.email
    end
  end

  def weekday_name
    DateTime.new.strftime('%A')
  end

  def class_of_options
    year = DateTime.now.year
    result = []
    6.times do |i|
      result.push(year + (i))
    end
    result
  end

  def participant_names(conversation)
    conversation.receipts.reject { |p| p.receiver == current_user }.collect {|p| p.receiver.name }.uniq.join(" ,")
  end

  def us_states
    Address.us_states.map { |state| [state, state] }
  end
  
  def states_collection
    options_for_select(Address.pluck(:state).uniq, params[:states])
  end
  
  def positions_collection
    options_for_select(Athlete.pluck(:primary_position).uniq, params[:positions])
  end
 end
