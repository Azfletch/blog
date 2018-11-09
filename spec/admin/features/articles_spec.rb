require "rails_helper"

RSpec.describe "Articles", type: :feature do
  describe "listing articles" do
    let!(:articles) { create_list(:article, 5) }

    it "displays a listing of articles" do
      visit_auth admin_articles_path

      articles.each do |article|
        expect(page).to have_content(article.title)
      end
    end
  end

  describe "creating a new article with valid" do
    it "creates a new article" do
      visit_auth new_admin_article_path

      fill_in "Title", with: "Fanta"
      fill_in "Text", with: "Fruit Twist"

      click_button "Create Article"

      expect(current_path).to eq(article_path(Article.first))
      expect(page).to have_content("Fanta")
    end
  end

  describe "editing an article" do
    let!(:article) { create(:article) }

    it "edits an existing article" do
      visit_auth edit_admin_article_path(article)

      fill_in "Title", with: "Article Edit"
      fill_in "Text", with: "Edited Text"

      click_button "Update Article"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Article Edit")
    end
  end

  describe "creating an article with invalid data" do
    it "should raise errors" do
      visit_auth new_admin_article_path

      click_button "Create Article"

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Title is too short (minimum is 5 characters)")
      expect(page).to have_content("Text can't be blank")
    end
  end
end