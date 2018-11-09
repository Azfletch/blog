class NotificationMailer < ApplicationMailer
  default from: "notifications@example.com"

  def notification_email(article)
    @article = article
    @notifications = Notification.all
    @notifications.each do |notification|
      mail(to: notification.email, subject: "New blog post!!!")
    end
  end
end
