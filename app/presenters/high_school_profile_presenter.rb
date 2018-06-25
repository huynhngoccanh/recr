class HighSchoolProfilePresenter
  attr_accessor :high_school, :user

  def initialize(high_school, user)
    @high_school = high_school
    @user = user
  end
end
