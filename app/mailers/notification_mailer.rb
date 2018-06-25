class NotificationMailer < ApplicationMailer

  def replied_notification(user, message)
    @message = message
    mail(to: user.email, subject: 'You have new message')
  end
end
