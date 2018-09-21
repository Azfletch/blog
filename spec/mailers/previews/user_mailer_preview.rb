# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def user_email_preview
    UserMailer.with(user: User.first).user_email
  end
end
