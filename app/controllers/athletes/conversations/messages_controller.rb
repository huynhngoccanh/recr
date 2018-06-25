class Athletes::Conversations::MessagesController < ApplicationController
  include AthleteScoped

  def create
    set_conversation
    @message = @conversation.messages.build message_params
    @message.user = current_user

    if @message.save
      redirect_to athlete_conversation_path(@athlete, @conversation)
    else
      render athlete_conversation_path(@athlete, @conversation)
    end
  end


  private
    def set_conversation
      @conversation = @athlete.conversations.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end

