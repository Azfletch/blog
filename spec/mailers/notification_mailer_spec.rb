require "rails_helper"

RSpec.describe Notifications, :type => :mailer do
  describe "notify" do
    let(:mail) { Notifications.signup }

    it "renders the headers" do
      expect(mail.subject).to eq("New blog post!!!")
      expect(mail.to).to eq([n.email])
      expect(mail.from).to eq("notifications@example.com")
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("A new article has been posted on Arrons blog!")
    end
  end
end