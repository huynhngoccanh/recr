class ChatChannel < ApplicationCable::Channel
  def subscribed
    conversation_id = params[:conversation_id] || params[:id]

    if current_user.coach?
      current_orgnization = current_user.profile.affiliation.organization
      conversations = current_orgnization.conversations
      @conversation = conversations.find(conversation_id)
    else
      conversations = current_user.profile.conversations
      @conversation = conversations.find(conversation_id)
    end

    if @conversation.present?
      stream_from "chat_#{conversation_id}"
    end
  end

  def unsubscribed
  end

  def send_message(data)
    message = Obscenity.sanitize(data['message'])
    current_user.reply_to_conversation(@conversation, message)
  end
end
