require "rails_helper"

describe "my blog" do
  before do
    create :article, title: "SHIFT"
  end

  it "displays an article on the website" do
    visit "/articles"

    expect(page).to have_content("SHIFT")
  end

  context "administration" do
    it "displays a listing of articles" do
      create :article, title: "Commerce"
      visit_auth "/admin/articles"

      expect(page).to have_content("SHIFT")
      expect(page).to have_content("Commerce")
    end

    it "creates a new article" do
      visit_auth "/admin/articles/new"

      fill_in "Title", with: "Fanta"
      fill_in "Text", with: "Fruit Twist"

      click_button "Create Article"

      expect(current_path).to eq("/articles/#{Article.last.id}")
      expect(page).to have_content("Fanta")
    end

    it "edits an existing article" do
      visit_auth "/admin/articles/#{Article.last.id}/edit"

      fill_in "Title", with: "Article Edit"
      fill_in "Text", with: "Edited Text"

      click_button "Update Article"

      expect(current_path).to eq("/articles/#{Article.last.id}")
      expect(page).to have_content("Article Edit")
    end
  end
end
