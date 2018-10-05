require "rails_helper"

RSpec.describe Notifications, :type => :mailer do
  describe "notify" do
    let(:mail) { Notifications.signup }

    it "renders the headers" do
      expect(mail.subject).to eq("New blog post!!!")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["notifications@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end