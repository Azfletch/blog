require "rails_helper"

RSpec.describe NotificationMailer, type: :mailer do
  describe "notify" do
    let!(:notification) { create(:notification) }
    let(:article) { create(:article) }
    let(:mail) { NotificationMailer.notification_email(article) }

    it "renders the headers" do
      expect(mail.subject).to eq("Arrons blog has been updated!")
      expect(mail.to).to eq([notification.email])
      expect(mail.from).to eq(["arron.fletcher@shiftcommerce.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Visit <a href=\"#{article_url(article)}\">#{article.title}</a> to view the latest post.")
    end
  end
end
