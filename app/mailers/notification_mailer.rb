class NotificationMailer < ApplicationMailer
  default from: "notifications@example.com"

  def notification_email(article)
    @article = article

    if Notification.all.empty?
      mail(to: "donald@duck.com", subject: "preview email")
    end
    
    @notification = Notification.all
    @notification.each do |n|
      mail(to: n.email, subject: "New blog post!!!")
    end
  end
end