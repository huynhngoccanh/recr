class ConversationsController < ApplicationController
  before_action :set_conversation, :only => [:create]
  layout 'conversation'

  def create
    receipt = current_user.reply_to_conversation(@conversation, Obscenity.sanitize(params[:body]))
    redirect_to conversation_path(receipt.conversation)
  end

  def index
    if current_user.coach?
      current_orgnization = current_user.profile.affiliation.organization
      conversations = current_orgnization.conversations(created_at: :asc)
      redirect_to conversation_path(conversations.first.id)
    else
      conversations = current_user.profile.conversations(created_at: :asc)
      redirect_to conversation_path(conversations.first.id)
    end
  end

  def show
    # if current_user? coach
    # end

    if current_user.coach?
      current_orgnization = current_user.profile.affiliation.organization
      @conversations = current_orgnization.conversations
      organization_id =  current_orgnization.id
      # messaged_athletes =  @conversations.map(&:athlete)
      @conversation =  @conversations.find(params[:id])
      @messages = @conversation.messages
      @athlete = @conversation.athlete
    else
      @conversations = current_user.profile.conversations(created_at: :asc)
      @conversation =  @conversations.find(params[:id])
      @messages = @conversation.messages
      @organization = @conversation.organization
    end

    @conversations = sort_by_recent_messages(@conversations)
    Notification.where(recipient: current_user).where(notifiable: @messages)
      .update_all(read_at: Time.current)
  end

  def create_new_message
  end

  private
    def set_conversation
      @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
    end

    def sort_by_recent_messages(conversations)
      conversations.sort_by do |conv|
        conv.messages.last.try(:created_at) || 2.years.ago
      end.reverse
    end
end
