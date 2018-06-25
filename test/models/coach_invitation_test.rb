require 'test_helper'

class CoachInvitationTest < ActiveSupport::TestCase
  def setup
    @high_school = high_schools(:high_school)
    @coach = coaches(:high_school_coach)
    @params = { "new"=>
                [
                  {"first_name"=>"chris", "last_name"=>"zmepel", "email"=>"test@example.com"},
                  {"first_name"=>"", "last_name"=>"", "email"=>""},
                  {"first_name"=>"", "last_name"=>"", "email"=>""}
                ]
              }.with_indifferent_access
  end

  def test_invitation_with_good_credentials
    invitation = CoachInvitation.new(@params, @high_school, @coach)

    assert_difference ['Coach.count', 'User.count', 'Affiliation.count'], 1 do
      invitation.save
    end
  end

  def test_invitation_with_bad_credentials
    params = @params.dup
    params[:new][0][:email] = ""

    invitation = CoachInvitation.new(params, @high_school, @coach)

    assert_difference ['Coach.count', 'User.count', 'Affiliation.count'], 0 do
      invitation.save
    end
  end
end
