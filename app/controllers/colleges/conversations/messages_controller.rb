class Colleges::Conversations::MessagesController < ApplicationController
  include CollegeScoped

  def create
    set_conversation
    @message = @conversation.messages.build message_params
    @message.user = current_user

    if @message.save
      redirect_to college_conversation_path(@college, @conversation)
    else
      render college_conversation_path(@college, @conversation)
    end
  end


  private
    def set_conversation
      @conversation = @college.conversations.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end


