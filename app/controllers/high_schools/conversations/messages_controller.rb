class HighSchools::Conversations::MessagesController < ApplicationController
  include HighSchoolScoped

  def create
    set_conversation
    @message = @conversation.messages.build message_params
    @message.user = current_user

    if @message.save
      redirect_to high_school_conversation_path(@high_school, @conversation)
    else
      render high_school_conversation_path(@high_school, @conversation)
    end
  end


  private
    def set_conversation
      @conversation = @high_school.conversations.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end
