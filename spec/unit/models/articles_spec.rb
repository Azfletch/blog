require "rails_helper"

RSpec.describe Article, type: :model do
  describe "creating a new valid article" do
    let(:article) { build(:article) }

    it "should be valid" do
      expect(article).to be_valid
    end
  end

  describe "creating an article" do
    it "sends out an email when an article is created" do
      create(:notification)
      expect{create(:article)}.to change{ActionMailer::Base.deliveries.count}.by(1)
    end
  end

  describe "creating an invalid article" do
    let(:article) { build(:article, title: "Test") }

    it "should be invalid" do
      expect(article).not_to be_valid
    end
  end 

  describe "editing an article with valid data" do
    let!(:article) { create(:article) }

    it "should be updated" do
      article.update(title: "Testing123", text: "123121231")

      expect(article).to have_attributes(title: "Testing123")
    end
  end
end
