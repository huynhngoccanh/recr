class TranscriptRequestsMailer < ApplicationMailer

  def transcript_request(athlete, college_coach_user)
    @athlete = athlete
    @high_school = @athlete.high_school
    @college_coach_user = college_coach_user
    @college = @college_coach_user.profile.school

    mail(to: @high_school.counselor_email, reply_to: @college_coach_user.email, cc: @college_coach_user.email,
         subject: "Coach #{@college_coach_user.name} from #{@college.name} has requested the transcript of #{@athlete.name}")
  end
end
