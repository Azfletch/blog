class NotificationMailerPreview < ActionMailer::Preview
  def notification_email
    NotificationMailer.notification_email(Article.first)
  end
end