require "rails_helper"

RSpec.describe NotificationMailer, :type => :mailer do
  describe "notify" do
    before(:all) do
      @notification = create(:notification)
    end

    let(:article) { create(:article) }
    let(:mail) { NotificationMailer.notification_email(article) }

    it "renders the headers" do
      expect(mail.subject).to eq("New blog post!!!")
      expect(mail.to).to eq([@notification.email])
      expect(mail.from).to eq(["notifications@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("A new article has been posted on Arrons blog!")
    end
  end
end
