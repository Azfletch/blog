require "rails_helper"

RSpec.describe "Articles", type: :feature do
  describe "viewing an article" do
    let!(:article) { create(:article) }

    it "displays an article on the website" do
      visit articles_path

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.text)
    end
  end

  describe "listing articles" do
    let!(:articles) { create_list(:article, 5) }

    it "displays a listing of articles" do
      visit_auth articles_path

      articles.each do |article|
        expect(page).to have_content(article.title)
      end
    end
  end
end
