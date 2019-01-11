class NotificationMailer < ApplicationMailer

  def notification_email(article)
    @article = article

    Notification.in_batches.each_record do |notification|
      mail(
        to: notification.email,
        subject: "Arrons blog has been updated!",
        from: "arron.fletcher@shiftcommerce.com",
        )
    end
  end
end
