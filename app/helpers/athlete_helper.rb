module AthleteHelper
  def display_new_form?(resource)
    if resource.errors.any?
      ""
    else
      "display: none;"
    end
  end

  def height_and_weight_display(athlete)
    height = human_height_display(athlete.height)
    weight = human_weight_display(athlete.weight)

    if height.present? && weight.present?
      [height, " / ", weight].join
    elsif height.present? || weight.present?
      [height, weight].compact.join
    else
      "height/weight not set"
    end
  end

  def human_height_options
    (56..112).to_a.map { |inch| [(inch/12).floor.to_s+'\''+(inch%12).to_s, inch.to_s] }
  end

  def human_height_display(height_in_inches)
    return nil unless height_in_inches

    feet = (height_in_inches/12).floor.to_s
    inches = height_in_inches % 12

    result = "#{feet}'"
    result += ("#{inches}" + '"') unless inches == 0
    result
  end

  def human_weight_options
    (100..400).to_a.select! { |pounds| pounds % 5 == 0 }
  end

  def human_weight_display(weight)
    result = ''
    result += "#{weight}"
    result += " lbs" unless weight.nil?
    result
  end

  def current_week_display
    [format_date(DateTime.now.at_beginning_of_week), " - ", format_date(DateTime.now.at_end_of_week)].join
  end

  def format_date(date_time)
    date_time.strftime("%a, %B %d")
  end
end
