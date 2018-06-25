class TranscriptRequestsController < ApplicationController

  def create
    @athlete = Athlete.find(transcript_request_params[:athlete_id])

    TranscriptRequestsMailer.transcript_request(@athlete, current_user).deliver_now
  end


  private
    def transcript_request_params
      params.require(:transcript_request).permit(:athlete_id)
    end
end
