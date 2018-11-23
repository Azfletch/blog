class NotificationMailer < ApplicationMailer

  def notification_email(article)
    @article = article
    notifications = Notification.all
    notifications.each do |notification|
      mail(
        to: notification.email,
        subject: "Arrons blog has been updated!",
        from: "arron.fletcher@shiftcommerce.com",
        track_opens: "true"
        )
    end
  end
end
