require 'obscenity/active_model'

class Message < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :conversation

  validates_presence_of :body
  validates :body, obscenity: { sanitize: true }

  after_create :create_new_message_notification
  after_create :broadcast

  def name
    if user
      user.name
    else
      display_name
    end
  end

  private

    def create_new_message_notification
      users_to_notify.each do |u|
        n = Notification.create(
          recipient_id: u.id,
          actor_id: user.id,
          notifiable: self,
          action: "sent a"
        )
      end
    end

    def users_to_notify
      users = []
      users.push conversation.athlete.user
      users.push conversation.organization.coach_users
      users.flatten!
      users.delete(user)
      users
    end

    def broadcast
      ActionCable.server.broadcast("chat_#{conversation_id}",
        avatar: user.profile.avatar.url,
        user_id: user.id,
        user_name: user.profile.name,
        message: body
      )

      if Rails.env.production?
        if conversation.athlete.user == user
          conversation.organization.coach_users.each do |coach_user|
            send_message_notification(coach_user)
          end
        else
          send_message_notification(conversation.athlete.user)
        end
      end

      true
    end

    def store_name
      update(name: user.name)
    end

    def send_message_notification(noti_user)
      unless noti_user.is_online?
        NotificationMailer.replied_notification(noti_user, self).deliver_now rescue nil
      end
    end
end
