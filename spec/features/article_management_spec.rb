require "rails_helper"

RSpec.feature "Article management", :type => :feature do
  scenario "User can see articles" do
    visit "/articles"

    expect(page).to have_text("All Published Articles")
  end
end

RSpec.feature "Article management", :type => :feature do
  scenario "User can view the content of an article" do
    visit "/articles"

    within('td') do
      click_link 'Show'
    end 

    expect(page).to have_content("Title")
  end
end